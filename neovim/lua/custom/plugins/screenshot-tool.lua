return {
  "ellisonleao/carbon-now.nvim",
  lazy = true,
  cmd = "CarbonNow",
  ---@param opts cn.ConfigSchema
  opts = {
    base_url = "https://carbon.now.sh/",
    options = {
      bg = "gray",
      drop_shadow_blur = "68px",
      drop_shadow = false,
      drop_shadow_offset_y = "20px",
      font_family = "Hack",
      font_size = "18px",
      line_height = "133%",
      line_numbers = true,
      theme = "Nord",
      titlebar = "Made with carbon-now.nvim",
      watermark = false,
      width = "680",
      window_theme = "sharp",
      padding_horizontal = "0px",
      padding_vertical = "0px",
    },
  },
  -- 快捷键映射：可视模式
  vim.keymap.set('v', '<leader>cn', ':CarbonNow<CR>', { silent = true, desc = "Carbon: 截取选区" }),
  -- 普通模式：全文件截图
  vim.keymap.set('n', '<leader>cf', ':CarbonNow<CR>', { silent = true, desc = "Carbon: 全文件截图" }),

}
