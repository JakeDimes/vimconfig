set nocompatible              " be iMproved, required
filetype off                  " required


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'preservim/nerdtree'
Plugin 'vim-airline/vim-airline'
" themes "
Plugin 'jacoborus/tender.vim'
Plugin 'lervag/vimtex'

" Track the engine.
Plugin 'SirVer/ultisnips'

Plugin 'ycm-core/YouCompleteMe'

Plugin 'ervandew/supertab'


Plugin 'xuhdev/vim-latex-live-preview'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



syntax on
colorscheme tender

" color correction (macOS)
if has('macunix')
	set backspace=indent,eol,start	
	highlight Normal ctermbg=NONE
	highlight nonText ctermbg=NONE
endif

" enable line numbers
set number
set relativenumber

" enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> = za

" NERDTree config
nnoremap <C-n> = :NERDTreeToggle<CR>
let NERDTreeCustomOpenArgs={'file':{'where': 't'}}
" Refresh the current folder if any changes
autocmd BufEnter NERD_tree_* | execute 'normal R'
au CursorHold * if exists("t:NerdTreeBufName") | call <SNR>15_refreshRoot() | endif

" Reload the window if directory is changed
augroup DIRCHANGE
	au!
	autocmd DirChanged global :NERDTreeCWD
augroup END

" enable highlighting
set hlsearch

" change tab switch keys
nnoremap # = gt
nnoremap @ = gT

" Cursors
au InsertEnter * silent execute "!echo -en \<esc>[5 q"
au InsertLeave * silent execute "!echo -en \<esc>[2 q"

" YouCompleteMe Configuration
let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm/global_extra_conf.py'

" Ultisnips configuration

" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsEditSplit="vertical"


" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<tab>"

