set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
" let Vundle manage Vundle, required

" Load Vim-Plug, instead of Vundle
"if empty(glob("~/.vim/autoload/plug.vim"))
"    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
if empty(glob("~/.local/share/nvim/site/autoload"))
"if empty(glob("~/.cfg/.local/share/nvim/site/autoload"))
    " Neovim (~/.local/share/nvim/site/autoload)
    execute '!curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim '
endif

"endif 
" Vundle Plugin
" Plug 'VundleVim/Vundle.vim'
call plug#begin('~/.vim/plugged')
" call plug#begin('~/.config/nvim/init.vim')


" Deprecated: I use either fzf or Ctrlp as they are much more efficient.
"function! BuildCT(info)
"    if a:info.status == 'installed' || a:info.force
"       !$HOME/config/dotfiles/scripts/vim-plugins/command-t.sh
"    endif
"endfunction
" # NeoViM Plugins
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }
Plug 'neomake/neomake'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'
Plug 'vim-scripts/indentpython.vim', { 'for': 'py' }
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'numkil/ag.nvim'
" Plug 'altercation/solarized'
" Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-abolish'
Plug 'terryma/vim-multiple-cursors'
"Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'lervag/vimtex'
Plug 'gruvbox-community/gruvbox'
Plug 'chrisbra/unicode.vim'
Plug 'majutsushi/tagbar'
Plug 'tomasr/molokai'
Plug 'junegunn/fzf'
Plug 'jph00/swift-apple', { 'for': 'swift' }
Plug 'tmhedberg/SimpylFold'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'leafgarland/typescript-vim', { 'for': 'ts' }
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'chriskempson/base16-vim'
Plug 'edkolev/tmuxline.vim' 

" Plug 'ying17zi/vim-live-latex-preview', { 'for': 'tex' }
"function! BuildYCM(info)
"    if a:info.status == 'installed' || a:info.force
"        !./install.py --clang-completer --ts-completer --java-completer --cs-completer
"   endif
"endfunction
"Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
"Plug 'Valloric/ycmd'
"Plug 'rdnetto/YCM-Generator'
" Plug 'kien/ctrlp.vim'
" Plug 'wincent/command-t', { 'do': function('BuildCT') }
" Plug 'vim-scripts/Conque-GDB'
" Plug 'w0rp/ale'
" Plug 'bling/vim-bufferline'
" Plug 'airblade/vim-gitgutter
" Plug 'flazz/vim-colorschemes'
call plug#end()

" The following are examples of different formats supported.
" Keep Plug commands between vundle#begin/end.
" plugin on GitHub repo
" Plug 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plug 'L9'
" Git plugin not hosted on GitHub
" Plug 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plug 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plug 'ascenator/L9', {'name': 'newL9'}

" All of your Plugs must be added before the following line
"call vundle#end()            " required
filetype plugin indent on    " required " To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PlugList       - lists configured plugins
" :PlugInstall    - installs plugins; append `!` to update or just :PlugUpdate
" :PlugSearch foo - searches for foo; append `!` to refresh local cache
" :PlugClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plug stuff after this line

"================ Syntastic ==============="
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_java_checker = ['javac']

"================== Theme =================" 
    syntax enable
    if filereadable(expand("~/.vimrc_background"))
        "let base16colorspace=256
        "set background=dark
        source ~/.vimrc_background
    endif

    "let g:gruvbox_contrast_dark="dark"
    "let g:airline_theme='gruvbox'
    "colorscheme gruvbox 
    let g:gruvbox_italic=1
    set background=dark
    set termguicolors
    set softtabstop=4
    set expandtab
    set shiftwidth=4

    " Spell checker
    "set spell
    "set spelllang=en_us
    "set spelllang=en_ca

"================ UI Config ==============="
    set number
    set showcmd
    set cursorline
    filetype indent on
    set showmatch
    set laststatus=2
    set autoread
    set tags=./tags;,tags$HOME
    set tags+=$HOME/anaconda3/envs/fastai/lib/python3.6/site-packages/torch/tags
    set tags+=$HOME/anaconda3/envs/fastai/lib/python3.6/site-packages/torchvision/tags

    " Windows
    " set tags+=$HOME/site-packages/torch/tags
    " set tags+=$HOME/site-packages/torchvision/tags

"================ Searching ==============="
    set incsearch
    set hlsearch
    :hi Search ctermbg=3 ctermfg=8

"================ Movement ================"
    set ttyfast
    nnoremap B ^
    nnoremap E $
    set backspace=indent,eol,start
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-K> <C-W><C-K> nnoremap <C-J> <C-W><C-J>
    nnoremap <C-H> <C-W><C-H>

"================ Shortcuts ==============="
    let mapleader='\'
    inoremap jk <esc>
    nnoremap <leader>ve :vsp ~/.vimrc<CR>
    nnoremap <leader>vs :source ~/.vimrc<CR>
    nnoremap <leader>w :update<CR>
    nnoremap <leader>. :CtrlPTag<CR>
    nnoremap <leader>md :MarkdownPreview<CR>

    " Folding with <Space> toggles the fold
    nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
    nnoremap <leader>f :!`ctags -R -f ./.git/tags .`<CR>
    nnoremap <leader>tg :TagbarToggle <CR>
    " Bind \ q to toggle double quotes
    nnoremap <leader>q :cs"q <CR>
    " let g:ConqueGdb_Leader = '\\'
    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~ '\s'
    endfunction
    inoremap <silent><expr> <Tab>
                \ pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<Tab>" :
                \ coc#refresh()
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    " nnoremap <Tab> gt
    " nnoremap <S-Tab> gT
    vnoremap <Space> zf
    nnoremap <leader>q 0i"<Esc>Ea"<Esc>
    set pastetoggle=<F9>

"================ NERDTree ================"
    nnoremap <leader>d :NERDTree<CR>
"    let g:NERDTreeDirArrowExpandable="+"
"    let g:NERDTreeDirArrowCollapsible="~"

"=============== Conque-GDB ==============="
    "let g:ConqueTerm_Color = 2         " 1: strip color after 200 lines, 2: always with color
    "let g:ConqueTerm_CloseOnEnd = 1    " close conque when program ends running
    "let g:ConqueTerm_StartMessages = 0 " display warning messages if conqueTerm is configured incorrectly 

"=============== Vim Airline =============="
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
else
    let g:airline_left_sep = '»'
    let g:airline_left_sep = '▶'
    let g:airline_right_sep = '«'
    let g:airline_right_sep = '◀'
    let g:airline_symbols.crypt = '🔒'
    let g:airline_symbols.linenr = '☰'
    let g:airline_symbols.linenr = '␊'
    let g:airline_symbols.linenr = '␤'
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.maxlinenr = ''
    let g:airline_symbols.maxlinenr = '㏑'
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.paste = 'Þ'
    let g:airline_symbols.paste = '∥'
    let g:airline_symbols.spell = 'Ꞩ'
    let g:airline_symbols.notexists = 'Ɇ'
    let g:airline_symbols.whitespace = 'Ξ'

    "=== Powerline Symbols ==="
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = '☰'
    let g:airline_symbols.maxlinenr = ''
    let g:airline_theme='hybrid'
    let g:bufferline_show_bufnr = 0
endif

"============= YCM Config ============="
" let g:ycm_global_ycm_extra_conf = \"~/.vim/bundle/ycmd/.ycm_extra_conf.py"
let g:ycm_global_ycm_extra_conf = "~/.vim/plugged/ycmd/.ycm_extra_conf.py"

"============ Format  ============"
au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=119 expandtab autoindent fileformat=unix listchars=tab:>-
au BufNewFile,BufRead *.cpp set tabstop=2 softtabstop=2 shiftwidth=2 textwidth=119 expandtab autoindent fileformat=unix
au BufNewFile,BufRead *.c set tabstop=2 softtabstop=2 shiftwidth=2 textwidth=119 expandtab autoindent fileformat=unix
au BufNewFile,BufRead *.h set tabstop=2 softtabstop=2 shiftwidth=2 textwidth=119 expandtab autoindent fileformat=unix
au BufNewFile,BufRead *.hpp set tabstop=2 softtabstop=2 shiftwidth=2 textwidth=119 expandtab autoindent fileformat=unix
au BufNewFile,BufRead *.tex set syntax=tex
au BufNewFile,BufRead *.cls set syntax=tex
setlocal foldmethod=expr

au BufNewFile,BufRead *ts,*.js,*.html,*.css: set tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" This is used for detecting characters --> set list
" set listchars=tab:>-

"=================Misc================="
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"======= ViM-LaTeX-Live-Preview ======="
let g:livepreview_previewer = 'okular'
" let g:livepreview_engine = 'your_engine' . ' [options]'
let g:livepreview_cursorhold_recompile = 1
autocmd Filetype tex setl updatetime=1
"========== Markdown Preview ==========="


" Vim-Airline Themes to Note:
let g:airline_theme="tomorrow"
let g:airline#extensions#tmuxline#enabled = 1
"let airline#extensions#tmuxline#snapshot_file = ~/config/dotfiles/src/themes/gruvbox-hard-dark-tmux.conf"
let airline#extensions#tmuxline#snapshot_file = "~/.tmux-status.conf"
" badwolf, badcat, light, powerlineish, etc.
" Just check out the screenshots page for more
" https://github.com/vim-airline/vim-airline/wiki/Screenshots
" Or customize your own.
let g:vimtex_compiler_progname = 'nvr'
"let g:Tex_ViewRule_pdf = 'okular'

let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'


" MarkdownPreview
let g:mkdp_auto_start = 1
