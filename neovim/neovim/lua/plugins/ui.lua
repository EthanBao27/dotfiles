return {
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  -- 1. 关闭 lazy.nvim 的自动更新检查和通知弹窗
  {
    "folke/lazy.nvim",
    opts = {
      checker = {
        enabled = true,
        notify = false
      },
    },
  },
  -- lazy.nvim
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.cmdline = {
        enabled = true,
        view = "cmdline_popup", -- 漂浮居中
        format = {
          cmdline     = { icon = "" },
          search_down = { icon = " " },
          search_up   = { icon = " " },
        },
      }
      opts.views = {
        cmdline_popup = {
          position = { row = 5, col = "50%" },
          size = { width = 60, height = "auto" },
          border = { style = "rounded", padding = { 0, 1 } },
          win_options = { winhighlight = "Normal:Normal,FloatBorder:FloatBorder" },
        },
      }
      -- 淡入淡出动画
      opts.animations = {
        enabled = true,
        stages = "fade_in_slide_out",
      }
      opts.lsp = {
        progress = { enabled = true },
        signature = { enabled = true },
        hover = { enabled = false }, -- 我想让 lspsaga 接管 hover
      }
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "catppuccin/nvim", -- 仅用于主题颜色
      { "rcarriga/nvim-notify", opts = { background_colour = "#000000" } },
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  }
}
