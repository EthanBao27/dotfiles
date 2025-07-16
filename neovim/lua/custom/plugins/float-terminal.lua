return {
  'akinsho/toggleterm.nvim',
  version = "*",
  opts = {
    size = 20,
    open_mapping = [[<C-\>]],   -- 使用 Ctrl+\ 打开终端
    direction = "float",        -- 采用浮动终端窗口
    float_opts = {
      border = "curved",
    },
  },
  config = function(_, opts)
    -- 传入 opts 完成 toggleterm 的基础配置
    require("toggleterm").setup(opts)

    -- 添加自定义命令：在内置终端中启动 Spring Boot 程序
    vim.api.nvim_create_user_command("RunSpring", function()
      require("toggleterm.terminal").Terminal:new({
        cmd = "mvn spring-boot:run",   -- 根据需要调整启动命令（如 Gradle 项目可用 ./gradlew bootRun）
        direction = "float",
        close_on_exit = false,
      }):toggle()
    end, { nargs = 0 })
  end,
}
