set nocompatible
set rtp+=/usr/local/opt/fzf
syntax enable
" mouse
set mouse=a
set showmatch
set clipboard=unnamed
set ts=4
set sts=4
set sw=4
set autoindent
"hi Search ctermbg=Brown ctermfg=Black
set smartindent
set smarttab
set expandtab
set number
set relativenumber
set pastetoggle=<F2>
set backspace=indent,eol,start
set wildignore+=*.a,*.o
set wildignore+=*.bmp,*.ico,*.jpg,*.png,*.gif
set wildignore+=.DS_Store,.git,.hg,.svn
set wildignore+=*.swp,*.tmp

set laststatus=2
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
"Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'severin-lemaignan/vim-minimap'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jordwalke/flatlandia'
Plugin 'yuttie/comfortable-motion.vim'
Plugin 'tpope/vim-surround'
Plugin 'easymotion/vim-easymotion'
Plugin 'jiangmiao/auto-pairs'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'vhda/verilog_systemverilog.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'HHammond/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'bling/vim-bufferline'
Plugin 'ryanoasis/vim-devicons'
Plugin 'lfv89/vim-interestingwords'
"Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"filetype plugin on
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line
colorscheme Tomorrow-Night-Bright
let NERDTreeChDirMode=2
let g:airline_theme='tomorrow'
let g:airline_powerline_fonts = 1
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#ctrlp#color_template = 'visual'
let g:airline#extensions#ctrlp#show_adjacent_modes = 1
set completeopt-=preview
"highlight Pmenu ctermfg=White
" for vim demicons you need change iterms fount for non acci to some nerd font
" in the profile settings.
set encoding=utf8

" utilsnips stuff
let g:UltiSnipsExpandTrigger="<C-j>"

" Key remapping stuff
let mapleader = ','
nnoremap <leader>w <c-w>
nnoremap <leader>df :YcmCompleter GoToDefinition<CR>
nnoremap <leader>r :BTags<CR>
" used to search at a specifc function declaration.
nnoremap <leader>dd g<c-]>
"NERDTreeTabToggle
nnoremap <c-\> :NERDTreeTabsToggle<CR>
nnoremap <leader>y :NERDTree %<CR>
nnoremap <leader>cd :lcd %:h<CR>
" go to vimrc in the current buffer.
nnoremap <leader>v :e ~/.vimrc<CR>
"moving from tabs next and back
nnoremap <leader>n :tabn<CR>
nnoremap <leader>b :tabp<CR>
nnoremap <leader>M <C-W>\| <C-W>_
nnoremap <leader>m <C-W>=
" search highlight toggle
nnoremap <silent> <leader>st :set hlsearch!<cr>
nnoremap <C-p> :Files<CR>

"let g:ctrlp_match_window = 'results:100'
"autocmd FileType java setlocal omnifunc=javacomplete#Complete
"let g:ycm_semantic_triggers =  {'java': 're!.'}
"let g:ycm_collect_identifiers_from_tags_files = 1  
"let g:ycm_key_list_select_completion = ['<tab>', '<Down>']

"noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(50)<CR>
"noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-50)<CR>
"let g:comfortable_motion_friction = 100.0
"let g:comfortable_motion_air_drag = 2.0


" ycm stuff
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_key_list_stop_completion = ['<ENTER>']
let g:EclimCompletionMethod = 'omnifunc'
"let g:loaded_youcompleteme = 1
" NERD Tree stuff
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
" comfortmotion
