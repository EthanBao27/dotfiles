return {
    'sainnhe/gruvbox-material',
    priority = 1000, -- 确保比其他插件先加载
    init = function()
        -- 主题配置 (在 colorscheme 之前)
        vim.g.gruvbox_material_background = 'hard' -- 可选: 'hard' | 'medium' | 'soft'
        vim.g.gruvbox_material_enable_italic = 1
        vim.g.gruvbox_material_transparent_background = 1
        vim.g.gruvbox_material_better_performance = 1
        vim.g.gruvbox_material_palette = 'material' -- 可选: 'material' | 'mix' | 'original'

        -- 设置 colorscheme
        vim.cmd.colorscheme 'gruvbox-material'
        vim.cmd.hi 'Comment gui=none'
    end,
    config = function()
        -- 自定义高亮设置
        vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#d8a657" })       -- yellow
        vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#323d43" }) -- surface0 类似
        vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { fg = "#d8a657", bg = "#323d43" })
        vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { fg = "#d8a657" })
    end,
}