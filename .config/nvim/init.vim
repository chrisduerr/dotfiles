" Plugins
call plug#begin("~/.config/nvim/plugins")

" Appearance
    " Vim-Airline
    Plug 'vim-airline/vim-airline'
    " Vim-Airline Theme
    Plug 'UndeadLeech/vim-undead'
    " Fancy Startscreen
    Plug 'mhinz/vim-startify'

" Programming
    " Auto Completion Engine
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py --racer-completer' }
    " YCM  configs
    Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
    " Rust
    Plug 'rust-lang/rust.vim'
    " Git Diff
    Plug 'airblade/vim-gitgutter'

" Usability
    " Auto pair brackets
    Plug 'jiangmiao/auto-pairs'
    " Mark Trailing Whitespaces
    Plug 'ntpeters/vim-better-whitespace'

cal plug#end()

syntax on
filetype plugin indent on
let mapleader=' '
set encoding=utf-8

" Plugin Configs
    " Vim-Airline
    function! AirlineInit()
        let g:airline_section_z = airline#section#create(['%l/%L %c'])
        let g:airline_section_b = airline#section#create(['branch'])
        " Disable for now to remove annoying orange blob at the end 24/7
        let g:airline_section_warning = ''
    endfunction
    autocmd User AirlineAfterInit call AirlineInit()
    let g:airline_theme = 'undead'

    " Airline symbols
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = '⸾'
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = '⸾'

    " Better Whitespace Plugin
    highlight ExtraWhitespace ctermbg=01

    " YCM
    let g:ycm_rust_src_path = '/usr/src/rust/src'

    " Startify
    let g:startify_list_order = [
        \ ['   Files:'], 'files',
        \ ['   This Directory:'], 'dir',
        \ ['   Sessions:'], 'sessions',
        \ ['   Bookmarks:'], 'bookmarks',
        \ ['   Commands:'], 'commands',
        \ ]
    let g:startify_custom_header = [
        \ '                    (_)        .       .                                     .',
        \ '     .        ____.--^.',
        \ '      .      /:  /    |                               +           .         .',
        \ "            /:  `--=--'   .                                                .",
        \ '           /: __[\==`-.___          *           .',
        \ '          /__|\ _~~~~~~   ~~--..__            .             .',
        \ '          \   \|::::|-----.....___|~--.                                 .',
        \ '           \ _\_~~~~~-----:|:::______//---...___',
        \ '       .   [\  \  __  --     \       ~  \_      ~~~===------==-...____',
        \ '           [============================================================-',
        \ "           /         __/__   --  /__    --       /____....----''''~~~~      .",
        \ "     *    /  /   ==           ____....=---='''~~~~ .",
        \ "         /____....--=-''':~~~~                      .                .",
        \ '                        .                                   .           .',
        \ '                             .                      .             +',
        \ '           .     +              .'
        \ ]

" Remaps
    " Clear search
    nnoremap <C-l> :noh<cr><C-l>

" indentation
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab autoindent

" Whatever
set relativenumber scrolloff=5

" Set colorscheme
colorscheme undead

" Set cursor shape
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
