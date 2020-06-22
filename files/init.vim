" Plugins
call plug#begin("~/.config/nvim/plugins")

" Appearance
    " Vim-Airline
    Plug 'vim-airline/vim-airline'
    " Vim-Airline theme
    Plug 'chrisduerr/vim-undead'

" Programming
    " Rust
    Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'make release'}
    " Git diff
    Plug 'airblade/vim-gitgutter'
    " Comment/uncomment text
    Plug 'tpope/vim-commentary'
    " Snippets
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    " Display function signatures
    Plug 'Shougo/echodoc.vim'
    " Auto completion engine
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    " Syntax highlighting for a ton of languages
    Plug 'sheerun/vim-polyglot'

" Usability
    " Mark trailing whitespaces
    Plug 'ntpeters/vim-better-whitespace'
    " Fuzzy finder and stuff, used for LanguageClient
    Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins'}
    " Surroundings
    Plug 'tpope/vim-surround'
    " Repeat plugin actions with '.'
    Plug 'tpope/vim-repeat'
    " Undo history visualizer
    Plug 'mbbill/undotree'

call plug#end()

let mapleader=' '
set encoding=utf-8
scriptencoding utf-8

" Case-insensitive pathname tab completion
set wildignorecase

" Persistent undo
set undodir=~/.config/nvim/.undo//
set backupdir=~/.config/nvim/.backup//
set directory=~/.config/nvim/.swp//
set undofile

" Better searching
set ignorecase smartcase incsearch hlsearch
nnoremap <C-L> :noh<CR><C-L>

" Show relative line numbers and never let cursor touch top/bottom
set relativenumber scrolloff=5

" Buffer navigation
map <Nop>a @<Plug>(GitGutterUndoHunk)
map <Nop>b @<Plug>(GitGutterStageHunk)
map <Nop>c @<Plug>(GitGutterPreviewHunk)
nnoremap <silent> <Leader>l :bn<CR>
nnoremap <silent> <Leader>h :bp<CR>

" Save root files
cnoremap w!! w !sudo tee % > /dev/null <CR>

" Set colorscheme
colorscheme undead

" Indentation
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab autoindent

" Hide -- INSERT -- in cmdline
set noshowmode

" Don't abandon buffers
set hidden

" Don't open preview window after completion
set completeopt-=preview

" Language-specific
au FileType css  set ts=2 sw=2 sts=2
au FileType html set ts=2 sw=2 sts=2

" Reset cursor after quitting vim
au VimLeave * set guicursor=a:hor100

" Hide 'match 1 of 8' messages
set shortmess=filnxtToOIc

" Disable Ex-Mode because the binding sucks on dvorak
nnoremap Q <NOP>

" Use tab for indenting
xnoremap <TAB> >gv|
xnoremap <S-TAB> <gv
nnoremap <TAB> >>_
nnoremap <S-TAB> <<_

" Yank to system clipboard
set clipboard+=unnamedplus

" Preview regex changes
set inccommand=nosplit

" Reopen files at last edit position
autocmd BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\   exe "normal! `\"" |
\ endif

" Plugin Configs
    " Vim-Airline
    function! AirlineInit()
        let g:airline_section_b = airline#section#create([''])
        let g:airline_section_c = airline#section#create([''])
        let g:airline_section_y = airline#section#create([''])
        let g:airline_section_z = airline#section#create(['%l/%L %c'])
    endfunction
    autocmd User AirlineAfterInit call AirlineInit()
    let g:airline_theme = 'undead'

    " Airline symbols
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''

    " Airline tabline
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#left_alt_sep = ''
    let g:airline#extensions#tabline#right_alt_sep = ''
    let g:airline#extensions#tabline#buffers_label = '%f'
    let g:airline#extensions#tabline#show_close_button = 0
    let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

    " Better Whitespace Plugin
    highlight ExtraWhitespace ctermbg=01

    " Echodoc
    let g:echodoc_enable_at_startup = 1

    " Deoplete
    call deoplete#custom#option('num_processes', 12)

    " Deoplete lazy loading
    autocmd InsertEnter * call deoplete#enable()

    " Denite
    call denite#custom#map('insert', '<Down>',
                         \ '<denite:move_to_next_line>', 'noremap')
    call denite#custom#map('insert', '<Up>',
                         \ '<denite:move_to_previous_line>', 'noremap')
    call denite#custom#option('default', 'prompt', '')
    call denite#custom#option('default', 'auto_resize', 'true')
    call denite#custom#option('default', 'statusline', 0)
    call denite#custom#option('default', 'highlight_matched_char', 'IncSearch')
    call denite#custom#option('default', 'highlight_matched_range', 'Normal')
    call denite#custom#option('default', 'highlight_mode_insert', 'NormalBold')

    " UltiSnips
    let g:UltiSnipsExpandTrigger="<c-y>"
    let g:UltiSnipsJumpForwardTrigger="<c-n>"
    let g:UltiSnipsJumpBackwardTrigger="<c-p>"

    " LanguageClient
    let g:LanguageClient_autoStart = 1
    let g:LanguageClient_useVirtualText = "No"
    let g:LanguageClient_serverCommands = {
    \ 'rust': ['rust-analyzer'],
    \ }
    nnoremap <silent> <Leader>D :Denite references<CR>
    nnoremap <silent> <Leader>r :call LanguageClient_textDocument_rename()<CR>
    nnoremap <silent> <Leader>d :call LanguageClient_textDocument_definition()<CR>
    nnoremap <silent> <Leader>f :call LanguageClient_textDocument_formatting()<CR>
    nnoremap <silent> <Leader>H :call LanguageClient_textDocument_hover()<CR>
