-- -- lua/custom/plugins/nord.lua
-- return {
--     "shaunsingh/nord.nvim",
--     priority = 1000, -- 提前加载
--     init = function()
--         -- 透明背景、样式偏好（nord.nvim 的内建选项）
--         vim.g.nord_disable_background = true
--         vim.g.nord_italic = false
--         vim.g.nord_borders = true

--         vim.cmd.colorscheme("nord")
--         vim.cmd.hi("Comment gui=none")
--     end,
--     config = function()
--         -- 把调色板放在 config 内，避免作用域问题
--         local p = {
--             bg0    = "#2E3440",
--             bg1    = "#3B4252",
--             bg2    = "#434C5E",
--             bg3    = "#4C566A",
--             fg     = "#D8DEE9",
--             red    = "#BF616A",
--             orange = "#D08770",
--             yellow = "#EBCB8B",
--             green  = "#A3BE8C",
--             aqua   = "#88C0D0",
--             blue   = "#81A1C1",
--             purple = "#B48EAD",
--             grey   = "#616E88",
--         }

--         local set_hl = vim.api.nvim_set_hl

--         -- 类似你在 catppuccin 的 highlight_overrides
--         set_hl(0, "CursorLineNr", { fg = p.yellow })
--         set_hl(0, "TelescopeSelection", { bg = p.bg2 })
--         set_hl(0, "TelescopeSelectionCaret", { fg = p.yellow, bg = p.bg2 })
--         set_hl(0, "TelescopePromptPrefix", { fg = p.yellow })

--         -- 如果开启透明背景，再把 Normal/NormalFloat 的 bg 清掉更干净
--         if vim.g.nord_disable_background then
--             set_hl(0, "Normal", { bg = "none" })
--             set_hl(0, "NormalFloat", { bg = "none" })
--             set_hl(0, "SignColumn", { bg = "none" })
--             set_hl(0, "NeoTreeNormal", { bg = "none" })
--         end
--     end,
-- }

return {}
