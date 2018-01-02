call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'

"Themes
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'
Plug 'tomasr/molokai'

"Movement and finding stuff
Plug 'yuttie/comfortable-motion.vim'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf.vim'
" Plug 'ludovicchabant/vim-gutentags'
Plug 'HHammond/vim-easytags'
Plug 'xolox/vim-misc'
Plug 'lfv89/vim-interestingwords' 
Plug 'mileszs/ack.vim'

"Language support and snippets
Plug 'vhda/verilog_systemverilog.vim'
Plug 'w0rp/ale'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'zchee/deoplete-jedi'
Plug 'Shougo/neco-vim'
Plug 'davidhalter/jedi-vim'
Plug 'justinmk/vim-syntax-extra'

"Completion stufff
" Plug 'Valloric/YouCompleteMe'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'ervandew/supertab'

"Appearance and visual
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-bufferline'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

"Setting set
set nocompatible
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif
set rtp+=/usr/local/opt/fzf
syntax enable
" mouse
set mouse=a
set ttyfast
set showmatch
set clipboard=unnamed
set ts=2
set sts=2
set sw=2
set autoindent
"hi Search ctermbg=Brown ctermfg=Black
set smartindent
set smarttab
set termguicolors
set expandtab
set updatetime=250
set number
set relativenumber
set pastetoggle=<F2>
set backspace=indent,eol,start
set wildignore+=*.a,*.o
set wildignore+=*.bmp,*.ico,*.jpg,*.png,*.gif
set wildignore+=.DS_Store,.git,.hg,.svn
set wildignore+=*.swp,*.tmp
set laststatus=2
" set completeopt-=preview
set encoding=utf8
" set omnifunc=syntaxcomplete#Complete
filetype plugin indent on    " required

"Color and visual stuff
" colorscheme Tomorrow-Night
" colorscheme base16-default-dark
colorscheme Molokai
let g:rehash256 = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let NERDTreeChDirMode=2
let g:airline_theme='base16_default'
let g:airline_powerline_fonts = 1
let g:airline#extensions#bufferline#enabled = 1

"Tags
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
"
" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources._ = ['tag']

"python 2 path
let g:deoplete#sources#jedi#python_path = '/usr/local/bin/python2'
"Python 3 path
" let g:deoplete#sources#jedi#python_path = '/usr/local/bin/python3'
let g:deoplete#sources#jedi#show_docstring = 1

" Jedi vim config
let g:jedi#goto_assignments_command = "<leader>gf"
let g:jedi#goto_definitions_command = "<leader>dd"
let g:jedi#usages_command = "<leader>nc"
let g:jedi#rename_command = "<leader>rn"
let g:jedi#completions_enabled = 0

"Super tab
let g:SuperTabDefaultCompletionType = "<c-n>"

" Utilsnips stuff
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<s-down>"
let g:UltiSnipsJumpBackwardTrigger="<s-up>"

if executable('rg')
    let g:ackprg = 'rg --vimgrep --no-heading'
endif

let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'python': ['pylint'],
\}

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['pylint'],
\}

" Key remapping stuff
let mapleader = ','
nnoremap <leader>w <c-w>
" nnoremap <leader>df :YcmCompleter GoToDefinition<CR>
nnoremap <leader>bt :BTags<CR>
" used to search at a specifc function declaration.
nnoremap <leader>dt g<c-]>
"NERDTreeTabToggle
nnoremap <c-\> :NERDTreeToggle<CR>
" nnoremap <leader>y :NERDTree %<CR>
nnoremap <leader>cd :lcd %:h<CR>
" go to vimrc in the current buffer.
nnoremap <leader>v :e ~/.config/nvim/init.vim<CR>
nnoremap <leader>rv :so $MYVIMRC<CR>
nnoremap <leader>M <C-W>\| <C-W>_
nnoremap <leader>m <C-W>=
" search highlight toggle
nnoremap <silent> <leader>st :set hlsearch!<cr>
nnoremap <C-t> :call Fzf_dev()<CR>
nnoremap <C-p> :Files <C-R>=expand('%:h')<CR><CR>
map <F12> :so tags.vim<CR>

" Open Ack and put the cursor in the right position
map <leader>ga :Ack!
xnoremap <Leader>a y:Ack! <C-r>=fnameescape(@")<CR><CR>
" When you press <leader>r you can search and replace the selected text
nnoremap <leader>h :Helptags<CR>
nnoremap <leader>bu :Buffers<CR>
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
" map <leader>n :cn<cr>
" map <leader>p :cp<cr>
nnoremap <leader>t :tabnew<CR>

" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], preview window, [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Files + devicons
function! Fzf_dev()
  function! s:files()
    let files = split(system($FZF_DEFAULT_COMMAND), '\n')
    return s:prepend_icon(files)
  endfunction

  function! s:prepend_icon(candidates)
    let result = []
    for candidate in a:candidates
      let filename = fnamemodify(candidate, ':p:t')
      let icon = WebDevIconsGetFileTypeSymbol(filename, isdirectory(filename))
      call add(result, printf("%s %s", icon, candidate))
    endfor

    return result
  endfunction

  function! s:edit_file(item)
    let parts = split(a:item, ' ')
    let file_path = get(parts, 1, '')
    execute 'silent e' file_path
endfunction

  call fzf#run({
        \ 'source': <sid>files(),
        \ 'sink':   function('s:edit_file'),
        \ 'options': '-m -x +s',
        \ 'down':    '40%' })
endfunction
