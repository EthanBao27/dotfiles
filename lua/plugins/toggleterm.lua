return {
  -- 1️⃣ 安装 & 设置 toggleterm.nvim
  "akinsho/toggleterm.nvim",
  version = "*",
  event = "VeryLazy",
  opts = {
    size = 15,
    direction = "float",
    shade_terminals = true,
    float_opts = { border = "rounded" },
  },

  -- 2️⃣ 插件加载后再注册 <leader>r 映射
  config = function(_, opts)
    require("toggleterm").setup(opts)

    local Term   = require("toggleterm.terminal").Terminal
    local runner = Term:new({ hidden = true, direction = "float", close_on_exit = false })

    vim.keymap.set("n", "<leader>r", function()
      vim.cmd("w")                      -- ① 保存
      local ft   = vim.bo.filetype
      local file = vim.fn.expand("%:p") -- 绝对路径

      -- ② 针对不同语言拼接命令
      local cmd  = ({
        python     = "python3 " .. file,
        lua        = "lua " .. file,
        javascript = "node " .. file,
        typescript = "deno run --allow-all " .. file,
        sh         = "bash " .. file,
        go         = "go run " .. file,
        rust       = "cargo run",
        cpp        = ("g++ %s -o %s && ./ %s"):format(file, file:gsub("%.%w+$", ""), file:gsub("%.%w+$", "")),
        c          = ("gcc %s -o %s && ./ %s"):format(file, file:gsub("%.%w+$", ""), file:gsub("%.%w+$", "")),
      })[ft] or ("bash " .. file)

      -- ③ 在浮动终端里运行
      runner:change_cmd(cmd)
      runner:toggle()
    end, { desc = "  Run current file", silent = true })
  end,
}
