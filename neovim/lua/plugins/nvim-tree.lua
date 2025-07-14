return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    lazy = false, -- neo-tree will lazily load itself
    ---@module "neo-tree"
    ---@type neotree.Config?
    opts = {
      -- fill any relevant options here
      filesystem = {
        window = {
          mappings = {
            ["<Tab>"] = function(state)
              local node = state.tree:get_node()
              if node.type == "directory" then
                state.commands.toggle_node(state)
              else
                state.commands.open(state)
              end
            end,
            ["<S-Tab>"] = function(state)
              local node = state.tree:get_node()
              if node.type == "directory" then
                -- 在目录上，用 close_node 折叠当前节点
                state.commands.close_node(state)
              else
                -- 在文件上，也打开（或者用其他操作）
                state.commands.open(state)
              end
            end,
          },
        },
      },
    },
  }
}
