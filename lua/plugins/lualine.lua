return {
  -- ② lualine
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function()
      -- 可选：Catppuccin 主题联动
      local ok, catppuccin = pcall(require, "catppuccin.groups.integrations.lualine")
      local theme = ok and catppuccin("mocha") or "auto"

      return {
        options = {
          theme                = theme,
          section_separators   = { left = "", right = "" },
          component_separators = { left = "", right = "" },
          globalstatus         = true, -- nvim 0.7+ 单行全局状态栏
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { { "filename", path = 1 } },
          lualine_x = { "filetype", "encoding" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      }
    end,
  },
}
