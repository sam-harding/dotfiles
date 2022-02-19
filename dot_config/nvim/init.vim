" General Vim Settings

set showmatch               " show matching brackets
set ignorecase              " case insensitive matching
set hlsearch                " highlight search results
set autoindent              " indent a new line the same amount as the line just typed

" I like using 4 spaces as a tab
set tabstop=4               " number of columns occupied by a tab character
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing

" Line numbers should be relative
set number relativenumber   " set line numbers to be relative
set number                  " add line numbers

" Plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'arcticicestudio/nord-vim'     " Nord Colourscheme Plugin
Plug 'preservim/nerdtree'           " NERDTree File Tree

" Better syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Code Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Fuzzy Find
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" Initialise plugins
call plug#end()

" Settings for the Terminal
augroup neovim_terminal
    autocmd!
    " Enter Terminal-mode (insert) automatically
    autocmd TermOpen * startinsert
    " Disables number lines on terminal buffers
    autocmd TermOpen * :set nonumber norelativenumber
    " " allows you to use Ctrl-c on terminal window
    " autocmd TermOpen * nnoremap <buffer> <C-c> i<C-c>
augroup END

" Pretty Colours!
colorscheme nord " Nord colourscheme for a nice chilly feel

" Mappings
nmap <C-P> :FZF<CR>
nmap <C-e> :NERDTreeToggle<CR>

" COC Mappings
"
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
