-- 按键配置
vim.g.mapleader = " "

---------- 插入模式 -----------
--- ESC 转换为jk/jj, INSERT
vim.keymap.set("i", "jk", "<ESC>", { noremap = true, silent = true })
vim.keymap.set("i", "jj", "<ESC>", { noremap = true, silent = true })

---------- 视觉模式 -----------
-- 单行或多行移动
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

---------- 正常模式 -----------
-- 窗口
vim.keymap.set("n", "<leader>sv", "<C-w>v") -- 水平新增窗口
vim.keymap.set("n", "<leader>sh", "<C-w>s") -- 垂直新增窗口

-- 取消高亮
vim.keymap.set("n", "<leader>nh", ":nohl<CR>")
-- 终端
-- 使用 <leader>t 打开终端
vim.keymap.set('n', '<leader>t', ':terminal<CR>', { noremap = true, silent = true })

-- 退出终端插入模式（回到普通模式）
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })

-- 快速切换窗口（在终端模式下）
vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], { noremap = true, silent = true })
vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], { noremap = true, silent = true })
vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], { noremap = true, silent = true })
vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], { noremap = true, silent = true })

---------- 插件 ---------------
-- nvim-tree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
-- 切换buffer
vim.keymap.set("n", "<C-L>", ":bnext<CR>")
vim.keymap.set("n", "<C-H>", ":bprevious<CR>")

-- Telescope 映射在Lazy配置文件

-- 切换顶部打开的窗口
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { silent = true })   -- 切换到下一个 buffer
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true }) -- 切换到上一个 buffer

--------写代码快捷键-----------
--- 一键运行SpringBoot项目
vim.api.nvim_set_keymap("n", "<leader>sp", ":RunSpring<CR>", { noremap = true, silent = true })
-- 保存并编译、运行当前 Java 文件：
vim.api.nvim_set_keymap(
  "n",
  "<leader>rj",
  ":w<CR>:lcd %:p:h<CR>:split | terminal javac %:t && java %:t:r<CR>",
  { noremap = true, silent = false }
)
-- 保存并用 `go run` 运行当前文件
vim.api.nvim_set_keymap(
  "n",
  "<leader>rg",
  ":w<CR>:lcd %:p:h<CR>:split | terminal go run %:t<CR>",
  { noremap = true, silent = false }
)

-- 保存并编译当前包，然后执行生成的二进制（放到仓库根目录 bin 里）
vim.api.nvim_set_keymap(
  "n",
  "<leader>gb",
  ":w<CR>:lcd %:p:h<CR>:split | terminal go build -o bin/%:t:r && ./bin/%:t:r<CR>",
  { noremap = true, silent = false }
)

-- 保存并运行当前包的测试
vim.api.nvim_set_keymap(
  "n",
  "<leader>gt",
  ":w<CR>:lcd %:p:h<CR>:split | terminal go test<CR>",
  { noremap = true, silent = false }
)
