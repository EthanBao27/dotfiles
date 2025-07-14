return {
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      -- 设置标题
      dashboard.section.header.val = {
        [[                                                     ]],
        [[  ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓ ]],
        [[  ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒ ]],
        [[ ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░ ]],
        [[ ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██  ]],
        [[ ▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒ ]],
        [[ ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░ ]],
        [[ ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░ ]],
        [[    ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░    ]],
        [[          ░    ░  ░    ░ ░        ░   ░         ░    ]],
        [[                                 ░                   ]],
        [[                     Ethan Bao                       ]],
      }

      -- 设置菜单
      dashboard.section.buttons.val = {
        dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
        dashboard.button("r", "  Recent files", ":Telescope oldfiles <CR>"),
        dashboard.button("s", "  Settings", ":e ~/.config/nvim/init.lua <CR>"),
        dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
      }

      -- 设置页脚
      dashboard.section.footer.val = "Ready to work!"

      -- 加载配置
      alpha.setup(dashboard.opts)
    end,
  },
}
