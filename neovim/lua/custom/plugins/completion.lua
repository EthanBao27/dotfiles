return {
  'saghen/blink.cmp',
  event = { 'BufReadPost', 'BufNewFile' },
  version = '1.*',
  opts = {
    completion = {
      documentation = {
        auto_show = true,
      },
      ghost_text = {
        enabled = false, -- 禁用ghost_text以避免列位置错误
      },
    },
    keymap = {
      ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
      ['<Tab>'] = { 'accept', 'fallback' },
      ['<CR>']  = { 'accept_and_enter', 'fallback' },
    },
    signature = {
      enabled = true,
    },
    cmdline = {
      completion = {
        menu = {
          auto_show = true,
        },
      },
    },
    sources = {
      providers = {
        snippets = { score_offset = 1000 },
      },
    },
  },
}
