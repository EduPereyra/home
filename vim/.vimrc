" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim80/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1
set laststatus=2
"set showtabline=2
let $PYTHONPATH="/usr/lib/python3.8/site-packages"
inoremap jk <ESC>
set number
set relativenumber
set cursorline
set t_Co=256
"highlight Cursorline cterm=bold ctermbg=Black

"These ones are for movings lines I think...
"nnoremap <C-j> :m .+1<CR>==
"nnoremap <C-k> :m .-2<CR>==
"inoremap <C-j> <Esc>:m .+1<CR>==gi
"inoremap <C-k> <Esc>:m .-2<CR>==gi
"vnoremap <C-j> :m '>+1<CR>gv=gv
"vnoremap <C-k> :m '<-2<CR>gv=gv

" Tab navigation (doesn't work?)
"nnoremap <C-S-tab> :tabprevious<CR>
"nnoremap <C-tab>   :tabnext<CR>
"inoremap <C-S-tab> <Esc>:tabprevious<CR>i
"inoremap <C-tab>   <Esc>:tabnext<CR>i

" XML Pretty print
nmap <leader>p ggVG !xmllint --format -<CR>

set selection=inclusive
syntax on
set showcmd
set ignorecase
set smartcase
set hlsearch 
set incsearch
set autoread

"Splits
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Incsearch made easier with tab? 
"onoremap <Tab> <C-g> 
"set wildcharm=<C-z>
"cnoremap <expr> <Tab>   getcmdtype() =~ '[\/?]' ? "<C-g>" : "<C-z>"
"cnoremap <expr> <S-Tab> getcmdtype() =~ '[\/?]' ? "<C-t>" : "<S-Tab>"

"fzf bindings
nnoremap <C-p> :Files<Cr>
nnoremap <C-b> :Buffers<Cr>

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
"
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'

"Vim-sneak
Plug 'justinmk/vim-sneak'

"incsearch pluging
Plug 'haya14busa/incsearch.vim'

"Lightline
"Plug 'itchyny/lightline.vim'

"Taboo
Plug 'gcmt/taboo.vim'

"Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'
Plug 'vim-scripts/Tabmerge'
Plug 'preservim/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
"Plug 'tpope/vim-fugitive'
"Themes
"Plug 'alessandroyorba/sidonia'
"Plug 'flrnd/candid.vim'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'ajmwagar/vim-deus'
"Plug 'morhetz/gruvbox'
"Nord theme
Plug 'arcticicestudio/nord-vim'

" Initialize plugin system
call plug#end()

"if (has('termguicolors'))
"set termguicolors
"endif

"let g:material_terminal_italics = 1
"let g:material_theme_style = 'darker'
"colorscheme material
colorscheme nord
"let g:nord_cursor_line_number_background = 1
"
"Airline Settings
let g:airline_powerline_fonts = 1
"let g:airline_theme='distinguished'
let g:airline_theme='nord'
"
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
"
"
"let g:gruvbox_italic = 1
"let g:gruvbox_italicize_comments = 1
"autocmd vimenter * ++nested colorscheme gruvbox
"set background=dark

"NerdTree settings
map <C-n> :NERDTreeToggle<CR>
" Close the tab if NERDTree is the only window remaining in it.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1

"incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
