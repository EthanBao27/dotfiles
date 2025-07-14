require("config.lazy")
require("core/keymaps")
require("core/options")
-- 首先引入 Telescope 内置功能模块
local builtin = require('telescope.builtin')

-- 设置快捷键映射
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find Files" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live Grep" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "List Buffers" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Help Tags" })
local cmp = require('cmp')
cmp.setup({
  mapping = {
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
})

-- 基础开关操作
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle File Explorer" })
vim.keymap.set("n", "<leader>o", "<cmd>Neotree focus<cr>", { desc = "Focus File Explorer" })

require('leap').create_default_mappings()

-- neovim 主题配置
require("catppuccin").setup({
  flavour = "frappe", -- latte / frappe / macchiato / mochaini
  integrations = {
    -- ⚠️ 这里不要再写 lualine = true
    -- 其他插件照常 true / false
    treesitter = true,
    cmp        = true,
    bufferline = true
  },
})
vim.cmd([[colorscheme catppuccin]])

vim.opt.termguicolors = true
vim.opt.showmode = false

require("notify").setup({ background_colour = "#000000" })

require("toggleterm.terminal")

-- Golsp
require('lspconfig').gopls.setup {
  cmd = { 'gopls' }, -- 直接调用全局可执行文件
  on_attach = on_attach,
  capabilities = capabilities,
}

-- NeoVide 配置
-- 设置 Neovide 的全局字体
vim.o.guifont = "JetBrainsMono Nerd Font Mono"
-- vim.o.guifont = "Maple Mono NF CN"
-- vim.o.guifont = "Input Mono"

-- 只有在设置过 guifont 并且是 GUI 客户端时才生效
local function change_font(delta)
  local gf = vim.o.guifont
  if gf == "" then
    vim.notify("guifont 未设置，无法调整字体大小", vim.log.levels.WARN)
    return
  end
  -- 提取当前字号，形如 "Source Code Pro:h14"
  local cur = tonumber(gf:match(":h(%d+)"))
  if not cur then
    vim.notify("无法解析 guifont 的字号部分：" .. gf, vim.log.levels.ERROR)
    return
  end
  vim.o.guifont = string.gsub(gf, ":h%d+", ":h" .. (cur + delta))
end

-- 增大字体：Ctrl + +
vim.keymap.set("n", "<C-+>", function()
  change_font(1)
end, { desc = "Increase GUI font size" })

-- 减小字体：Ctrl + -
vim.keymap.set("n", "<C-->", function()
  change_font(-1)
end, { desc = "Decrease GUI font size" })

-- 隐藏菜单栏
vim.g.neovide_title_hidden = true
vim.g.neovide_window_decorations = "buttonless"

-- 行间距
vim.opt.linespace = 0

-- 缩放比例
vim.g.neovide_scale_factor = 1.8

-- 文本伽马和对比度
vim.g.neovide_text_gamma = 0.0
vim.g.neovide_text_contrast = 0.5

-- 顶部、底部、右侧、左侧的内边距
vim.g.neovide_padding_top = 5
vim.g.neovide_padding_bottom = 5
vim.g.neovide_padding_right = 5
vim.g.neovide_padding_left = 5

-- 窗口透明度（内容和标题栏统一）
vim.g.neovide_transparency = 0.8

-- 窗口模糊效果（仅限 macOS）
vim.g.neovide_window_blurred = true

-- 浮动窗口的模糊半径
vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0

-- 浮动窗口的阴影效果
vim.g.neovide_floating_shadow = true
vim.g.neovide_floating_z_height = 10
vim.g.neovide_light_angle_degrees = 45
vim.g.neovide_light_radius = 5
vim.g.neovide_floating_corner_radius = 0.5

-- 窗口透明度
vim.g.neovide_transparency = 0.8
vim.g.neovide_background_color = "#0C0C0C"

vim.g.neovide_opacity = 0.15
vim.g.neovide_window_blurred = true
vim.g.neovide_theme = 'auto'

-- 配置neovide打开内置终端时候的色彩
-- Catppuccin Frappe
if vim.g.neovide then
  vim.g.terminal_color_0  = "#51576d"
  vim.g.terminal_color_1  = "#e78284"
  vim.g.terminal_color_2  = "#a6d189"
  vim.g.terminal_color_3  = "#e5c890"
  vim.g.terminal_color_4  = "#8caaee"
  vim.g.terminal_color_5  = "#f4b8e4"
  vim.g.terminal_color_6  = "#81c8be"
  vim.g.terminal_color_7  = "#b5bfe2"
  vim.g.terminal_color_8  = "#626880"
  vim.g.terminal_color_9  = "#e78284"
  vim.g.terminal_color_10 = "#a6d189"
  vim.g.terminal_color_11 = "#e5c890"
  vim.g.terminal_color_12 = "#8caaee"
  vim.g.terminal_color_13 = "#f4b8e4"
  vim.g.terminal_color_14 = "#81c8be"
  vim.g.terminal_color_15 = "#a5adce"
end


-- 显示边框（仅限 macOS）
vim.g.neovide_show_border = true

-- 位置动画时长
vim.g.neovide_position_animation_length = 0.15

-- 滚动动画时长
vim.g.neovide_scroll_animation_length = 0.3

-- 滚动时远端行数动画
vim.g.neovide_scroll_animation_far_lines = 1

-- 输入时隐藏鼠标
vim.g.neovide_hide_mouse_when_typing = false

-- 下划线自动缩放
vim.g.neovide_underline_stroke_scale = 1.0

-- 主题设置
vim.g.neovide_theme = 'dark'

-- 刷新率
vim.g.neovide_refresh_rate = 60

-- 空闲时的刷新率
vim.g.neovide_refresh_rate_idle = 5

-- 强制重绘
vim.g.neovide_no_idle = true

-- 退出时确认
vim.g.neovide_confirm_quit = true

-- 退出时脱离连接
vim.g.neovide_detach_on_quit = 'always_quit'

-- 全屏模式
vim.g.neovide_fullscreen = false

-- 记住之前的窗口大小
vim.g.neovide_remember_window_size = true

-- 开启性能分析器
vim.g.neovide_profiler = false

-- macOS 选项键作为 Meta 键
vim.g.neovide_input_macos_option_key_is_meta = 'only_left'

-- 启用 IME 输入
vim.g.neovide_input_ime = true

-- 触控屏幕的死区
vim.g.neovide_touch_deadzone = 6.0

-- 触控屏幕的拖动超时时间
vim.g.neovide_touch_drag_timeout = 0.17

-- 光标动画时长
vim.g.neovide_cursor_animation_length = 0.13

-- 光标轨迹大小
vim.g.neovide_cursor_trail_size = 0.8

-- 光标抗锯齿
vim.g.neovide_cursor_antialiasing = true

-- 在插入模式中动画光标
vim.g.neovide_cursor_animate_in_insert_mode = true

-- 切换到命令行时动画光标
vim.g.neovide_cursor_animate_command_line = true

-- 未聚焦时光标轮廓宽度
vim.g.neovide_cursor_unfocused_outline_width = 0.125

-- 平滑光标闪烁动画
vim.g.neovide_cursor_smooth_blink = false

-- 光标粒子效果模式
vim.g.neovide_cursor_vfx_mode = "railgun" -- 可设置为 "torpedo", "pixiedust", "sonicboom", "ripple", "wireframe", 或空字符串 ""

-- 粒子透明度
vim.g.neovide_cursor_vfx_opacity = 200.0

-- 粒子生命周期
vim.g.neovide_cursor_vfx_particle_lifetime = 1.2

-- 粒子密度
vim.g.neovide_cursor_vfx_particle_density = 7.0

-- 粒子速度
vim.g.neovide_cursor_vfx_particle_speed = 10.0

-- 粒子相位（仅适用于 railgun 模式）
vim.g.neovide_cursor_vfx_particle_phase = 1.5

-- 粒子卷曲（仅适用于 railgun 模式）
vim.g.neovide_cursor_vfx_particle_curl = 1.0

-- 格式化快捷键绑定
vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>",
  { noremap = true, silent = true })
-- 透明背景
vim.g.neovide_transparency = 0.8

-- coc.nvim 配置
vim.cmd([[
" 使用 [e 和 ]e 跳转到上一个和下一个错误
nmap <silent> [e <Plug>(coc-diagnostic-prev)
nmap <silent> ]e <Plug>(coc-diagnostic-next)
]])

-- 其他 coc.nvim 配置
vim.cmd([[
" 使用 <Tab> 和 <Shift-Tab> 进行补全选择
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" 触发代码补全
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
]])

-- 配置系统剪贴板复制和粘贴
vim.api.nvim_set_keymap('v', '<D-c>', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<D-v>', '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<D-v>', '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('c', '<D-v>', '<C-R>+', { noremap = true, silent = true })

-- 使用内置lsp配置代码自动格式化
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

-- python
vim.g.python3_host_prog = os.getenv("HOME") .. "/.pyenv/shims/python3"
