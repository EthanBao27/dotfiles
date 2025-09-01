return {
    'sainnhe/everforest',
    priority = 1000, -- 确保比其他插件先加载
    init = function()
        -- 主题配置 (在 colorscheme 之前)
        vim.g.everforest_background = 'hard' -- 可选: 'hard' | 'medium' | 'soft'
        vim.g.everforest_enable_italic = 1
        vim.g.everforest_transparent_background = 1
        vim.g.everforest_better_performance = 1

        -- 设置 colorscheme
        vim.cmd.colorscheme 'everforest'
        vim.cmd.hi 'Comment gui=none'
    end,
    config = function()
        -- everforest 自身没有像 catppuccin 那么丰富的 integrations
        -- 如果要覆盖高亮可以直接用 highlight API
        vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#d8a657" })       -- yellow
        vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#323d43" }) -- surface0 类似
        vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { fg = "#d8a657", bg = "#323d43" })
        vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { fg = "#d8a657" })
    end,
}

-- return {}
