return {
  -- === Mason & Mason-LSPConfig ===
  {
    "williamboman/mason.nvim",
    -- 这里不做 cmd 懒加载，启动时加载更方便自动安装
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
          icons = {
            package_installed   = "✓",
            package_pending     = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "pyright",
          "clangd",
          "rust_analyzer",
          "jdtls",
          "ts_ls",
        },
        automatic_installation = true,
      })
    end,
  },

  -- === nvim-lspconfig ===
  {
    "neovim/nvim-lspconfig",
    -- 可以加一个 event = "BufReadPre"，等到打开文件时才加载
    config = function()
      local lspconfig = require("lspconfig")

      -- 通用 on_attach
      local on_attach = function(client, bufnr)
        local bufmap = function(mode, lhs, rhs, desc)
          if desc then desc = "LSP: " .. desc end
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end
        bufmap("n", "gd", vim.lsp.buf.definition, "Go to Definition")
        bufmap("n", "gr", vim.lsp.buf.references, "References")
        bufmap("n", "K", vim.lsp.buf.hover, "Hover")
        bufmap("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
        bufmap("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
        bufmap("n", "[d", vim.diagnostic.goto_prev, "Prev Diagnostic")
        bufmap("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")
        bufmap("n", "<leader>q", vim.diagnostic.setloclist, "Diagnostics to LocList")
      end

      -- 通用 capabilities（配合 cmp_nvim_lsp）
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      if cmp_nvim_lsp_ok then
        capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
      end

      -- ===== 各个服务器的配置 =====

      -- Lua
      lspconfig.lua_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      })

      -- Python
      lspconfig.pyright.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      -- JavaScript / TypeScript
      lspconfig.ts_ls.setup({
        on_attach = function(client, bufnr)
          -- 禁用内置格式化
          client.server_capabilities.documentFormattingProvider = false
          on_attach(client, bufnr)
        end,
        capabilities = capabilities,
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
      })

      -- C / C++
      lspconfig.clangd.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      -- Rust
      lspconfig.rust_analyzer.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            checkOnSave = { command = "clippy" },
          },
        },
      })

      -- Java (jdtls)
      local home = os.getenv("HOME")
      local jdtls_path = home .. "/.local/share/nvim/mason/packages/jdtls"
      local config_name = vim.fn.has("macunix") == 1 and "config_mac" or "config_linux"
      lspconfig.jdtls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = {
          "java",
          "-Declipse.application=org.eclipse.jdt.ls.core.id1",
          "-Dosgi.bundles.defaultStartLevel=4",
          "-Declipse.product=org.eclipse.jdt.ls.core.product",
          "-Dlog.level=ALL",
          "-Xms1g",
          "-Xmx2G",
          "-javaagent:" .. jdtls_path .. "/lombok.jar",
          "-jar",
          vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
          "-configuration",
          jdtls_path .. "/" .. config_name,
          "-data",
          home .. "/workspace",
        },
        root_dir = lspconfig.util.root_pattern(".git", "pom.xml", "build.gradle"),
      })

      -- Go (gopls)
      require("lspconfig").gopls.setup({
        cmd = { "gopls" }, -- ← 指向系统安装的 gopls，可省略路径，只要 PATH 配置正确
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          gopls = {
            gofumpt = true,
            buildFlags = { "-tags=integration" },
            analyses = {
              unusedparams = true,
              shadow = true,
            },
            staticcheck = true, -- 可选：加上 staticcheck 进一步静态分析
          },
        },
      })
    end,
  },

  -- === 自动补全：nvim-cmp ===
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
        }, {
          { name = "buffer" },
        }),
      })

      -- GitCommit 特殊配置
      cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({
          { name = "cmp_git" },
        }, {
          { name = "buffer" },
        }),
      })
    end,
  },

  -- === 注释插件 ===
  {
    "numToStr/Comment.nvim",
    opts = {},
  },

  -- === 括号自动补全 ===
  {
    "windwp/nvim-autopairs",
    opts = {},
  },

  -- === Lua 库（plenary）===
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },

  -- === bufferline ===
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
      options = {
        mode = "buffers",
        numbers = "ordinal",
        separator_style = "slant",
        diagnostics = "nvim_lsp",
        show_buffer_close_icons = false,
        always_show_bufferline = false,
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            separator = false,
          },
        },
      },
      highlights = {
        -- 空白区
        fill = {
          bg = "#1f2335",
        },
        -- 所有未选中 buffer
        background = {
          bg = "#1f2335",
          fg = "#4b5263",
        },
        -- 选中 buffer
        buffer_selected = {
          bg  = "#292e42",
          fg  = "#c0caf5",
          gui = "bold",
        },
        -- 选中时下划线指示器（可选）
        indicator_selected = {
          bg = "#292e42",
          fg = "#89b4fa",
        },
      },
    },
    keys = {
      { "<S-h>", "<cmd>BufferLineCyclePrev<CR>", desc = "  Prev buffer" },
      { "<S-l>", "<cmd>BufferLineCycleNext<CR>", desc = "  Next buffer" },
      { "<leader>bd", "<cmd>:!BufferLineClose<CR>", desc = "󰅖  Close buffer" },
      { "<leader>tb", "<cmd>lua vim.o.showtabline = vim.o.showtabline == 0 and 2 or 0<CR>", desc = "Toggle bufferline" },
    },
    config = function(_, opts)
      local apply = function() require("bufferline").setup(opts) end
      apply() -- 第一次加载
      -- 主题切换时再覆盖一次，防止颜色被重设
      vim.api.nvim_create_autocmd("ColorScheme", { callback = apply })
    end,
  },

  -- === gitsigns ===
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufRead", "BufNewFile" },
    opts = {
      signs = {
        add          = { text = "+" },
        change       = { text = "~" },
        delete       = { text = "-" },
        topdelete    = { text = "‾" },
        changedelete = { text = "~" },
      },
    },
    config = function(_, opts)
      require("gitsigns").setup(opts)
    end,
  },

  -- === telescope ===
  {
    "nvim-telescope/telescope.nvim",
    dependencies = "tsakirist/telescope-lazy.nvim",
  },

  -- 既然走 nvim-cmp，就可以移除 coc.nvim
  -- { "neoclide/coc.nvim", branch = "release" },
}
