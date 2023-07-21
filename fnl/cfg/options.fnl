;; creates a backup file
(set vim.opt.backup false)

;; allows neovim to access the system clipboard
(set vim.opt.clipboard :unnamedplus)

;; more space in the neovim command line for displaying messages
(set vim.opt.cmdheight 2)

;; mostly just for cmp
(set vim.opt.completeopt [:menuone :noselect])

;; so that `` is visible in markdown files
(set vim.opt.conceallevel 0)

;; the encoding written to a file
(set vim.opt.fileencoding :utf-8)

;; highlight all matches on previous search pattern
(set vim.opt.hlsearch true)

;; ignore case in search patterns
(set vim.opt.ignorecase true)

;; allow the mouse to be used in neovim
(set vim.opt.mouse :a)

;; pop up menu height
(set vim.opt.pumheight 10)

(set vim.opt.showmode false)

;; always show tabs
(set vim.opt.showtabline 2)

;; smart case
(set vim.opt.smartcase true)

(set vim.opt.smartindent true)

;; force all horizontal splits to go below current window
(set vim.opt.splitbelow true)

;; force all vertical splits to go to the right of current window
(set vim.opt.splitright true)

;; creates a swapfile
(set vim.opt.swapfile false)

;; set term gui colors (most terminals support this)
(set vim.opt.termguicolors true)

;; time to wait for a mapped sequence to complete (in milliseconds)
(set vim.opt.timeoutlen 1000)

;; enable persistent undo
(set vim.opt.undofile true)

;; faster completion (4000ms default)
(set vim.opt.updatetime 300)

(set vim.opt.writebackup false)

;; convert tabs to spaces
(set vim.opt.expandtab true)

;; the number of spaces inserted for each indentation
(set vim.opt.shiftwidth 2)

;; insert 2 spaces for a tab
(set vim.opt.tabstop 2)

;; highlight the current line
(set vim.opt.cursorline true)

;; set numbered lines
(set vim.opt.number true)

;; set relative numbered lines
(set vim.opt.relativenumber true)

;; set number column width to 4 {default 4}
(set vim.opt.numberwidth 4)

;; always show the sign column, otherwise it would shift the text each time
(set vim.opt.signcolumn :yes)

;; display lines as one long line
(set vim.opt.wrap false)

(set vim.opt.scrolloff 8)

(set vim.opt.sidescrolloff 8)

{}
