return {
  {
    "echasnovski/mini.animate",
    event = "VeryLazy", -- 延迟加载以提高启动速度
    opts = {
      cursor = {
        enable = true, -- 启用光标动画
      },
      scroll = {
        enable = true, -- 启用滚动动画
      },
      resize = {
        enable = true, -- 启用窗口调整动画
      },
    },
  },
  {
    "karb94/neoscroll.nvim",
    event = "BufReadPost", -- 打开文件时加载
    opts = {
      easing_function = "quadratic", -- 动画缓动函数
      hide_cursor = false, -- 滚动时隐藏光标
    },
    config = function(_, opts)
      require("neoscroll").setup(opts)
    end,
  },
   {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("dashboard").setup({
        theme = "doom", -- 或其他主题
        config = {
          header = {
            "Welcome to Neovim!", -- 自定义启动页面动画
          },
          footer = {
            "Ready to work!",
          },
        },
      })
    end,
  },
}
