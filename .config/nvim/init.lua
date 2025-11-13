
local vim = vim
local Plug = vim.fn[ 'plug#' ]

vim.call( 'plug#begin' )

Plug( "nvim-lua/plenary.nvim")
Plug( "nvim-telescope/telescope.nvim")
Plug( "nvim-telescope/telescope-fzf-native.nvim")
Plug( "nvim-treesitter/nvim-treesitter")
Plug( "vim-airline/vim-airline")
Plug( "vim-airline/vim-airline-themes")
Plug( "folke/tokyonight.nvim")
Plug( "tpope/vim-fugitive")
Plug( "neovim/nvim-lspconfig")

vim.call( 'plug#end' )

vim.cmd[[colorscheme tokyonight]]

vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 0
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.autoread = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cindent = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.showcmd = true
vim.opt.wildmenu = true
vim.opt.wildmode = { "longest:full", "full" }
vim.opt.cursorline = true
vim.opt.signcolumn = no

require( 'telescope' ).setup {
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        }
    }
}

require( 'telescope' ).load_extension( 'fzf' )

-- Airline configuration
vim.g[ 'laststatus' ] = 2
vim.g[ 'airline_powerline_fonts' ] = 1
vim.g[ 'airline#entension#branch#enabled '] = 1
vim.g[ 'airline#entension#tabline#enabled '] = 1
vim.g[ 'airline#entension#tabline#tab_nr_type '] = 2

-- Autoreload file when it changes on disk
vim.opt.autoread = true;
vim.api.nvim_create_autocmd( { "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
    command = "if mode() != 'c' | checktime | endif",
    pattern = { "*" },
})

-- C / C++ specific:
    vim.api.nvim_create_augroup( "cpp", { clear = true } )

    --> Clang-format files
    vim.api.nvim_create_autocmd( "BufWritepost", {
        group = "cpp",
        pattern = { '*.cpp', '*.c', '*.h', '*.hpp', '*.h.in' },
        command = ":silent !clang-format -i %"
    })

-- CMake format
vim.api.nvim_create_autocmd( "BufWritepost", {
    pattern = { '*.cmake', 'CMakeLists.txt' },
    command = ":silent !cmake-format -i %"
})

-- Remove all trailing whitespace
vim.api.nvim_create_autocmd( "BufWritePre", { pattern = '', command = ":%s/\\s\\+$//e" } )

-- Remove all tabs and replace with 4 spaces
vim.api.nvim_create_autocmd( "BufWritePre", { pattern = '', command = ":%s/\\t/    /e" } )

vim.lsp.enable('clangd')
require( "core.mappings" )


