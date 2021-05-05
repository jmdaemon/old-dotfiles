set nocompatible              " be iMproved, required
filetype off                  " required

if empty(glob("~/.local/share/nvim/site/autoload"))
    execute '!curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim '
endif

call plug#begin('~/.config/nvim/plugged')

" NeoViM Plugins
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'prabirshrestha/vim-lsp'
" Plug 'natebosch/vim-lsc'
"Plug 'georgewfraser/java-language-server' Not compatible with ViM LSP
"Plug 'mattn/vim-lsp-settings'
"Language Server
"Plug 'autozimu/LanguageClient-neovim', {
            "\ 'branch': 'next',
            "\ 'do': 'bash install.sh',
            "\ }


Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }
Plug 'neomake/neomake'
Plug 'Scuilion/gradle-syntastic-plugin'
Plug 'jiangmiao/auto-pairs', { 'on': [] }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'
Plug 'vim-scripts/indentpython.vim', { 'for': 'py' }
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'numkil/ag.nvim'
Plug 'tpope/vim-surround', { 'on': [] }
Plug 'tpope/vim-repeat', { 'on': [] }
Plug 'terryma/vim-multiple-cursors'
Plug 'habamax/vim-asciidoctor'
Plug 'tpope/vim-dispatch'
"Plug 'SirVer/ultisnips'   " Track the engine.
"Plug 'honza/vim-snippets' " Snippets are separated from the engine. Add this if you want them:
Plug 'lervag/vimtex'
Plug 'gruvbox-community/gruvbox'
Plug 'chrisbra/unicode.vim'
Plug 'majutsushi/tagbar'
Plug 'tomasr/molokai'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'jph00/swift-apple', { 'for': 'swift' }
Plug 'tmhedberg/SimpylFold'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'leafgarland/typescript-vim', { 'for': 'ts' }
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'chriskempson/base16-vim'
Plug 'edkolev/tmuxline.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'vlime/vlime', {'rtp': 'vim/'}

call plug#end()

"================ Syntastic ==============="
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_java_checker = ['javac']

let g:syntastic_java_checkers=['java']
let g:syntastic_java_javac_config_file_enabled = 1
"let g:syntastic_java__checkstyle_classpath="./syntactic_javac_config"

let g:syntastic_cpp_compiler_options = '-std=c++17x'
let g:syntastic_yaml_checkers = [ "yamllint" ]

let g:syntastic_c_compiler_options = '-std=C99'

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
set pastetoggle=<F9>
inoremap jk <esc>
nnoremap <leader>ft :set ft?<CR>
nnoremap <leader>ve :vsp ~/.vimrc<CR>
nnoremap <leader>vs :source ~/.vimrc<CR>
nnoremap <leader>w :update<CR>
nnoremap <leader>. :CtrlPTag<CR>
nnoremap <leader>md :MarkdownPreview<CR>
nnoremap <leader>d :NERDTree<CR>

nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
nnoremap <leader>f :!`ctags -R -f ./.git/tags .`<CR>
nnoremap <leader>tg :TagbarToggle <CR>

" Bind \ q to toggle double quotes
nnoremap <leader>q :cs"q <CR>
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

nnoremap <Tab> gt
nnoremap <S-Tab> gT
vnoremap <Space> zf
nnoremap <leader>q 0i"<Esc>Ea"<Esc>

"=============== Vim Airline =============="
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

let g:airline_theme="tomorrow"
let g:airline#extensions#tmuxline#enabled = 1
let airline#extensions#tmuxline#snapshot_file = "~/.tmux-status.conf"

" ================= Format =================
setlocal foldmethod=expr

au BufNewFile,BufRead *ts,*.js,*.html,*.css: set tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

autocmd BufEnter *.h :setlocal filetype=cpp
autocmd BufEnter *.hpp :setlocal filetype=cpp
autocmd BufEnter *.tpp :setlocal filetype=cpp

let g:formatterpath = [ "$HOME/.config/nvim/after/ftplugin/" ]

"map <C-K> :pyf /usr/share/clang/clang-format.py<cr>
"imap <C-K> <c-o>:pyf /usr/share/clang/clang-format.py<cr>
map <C-K> :py3f /usr/share/clang/clang-format.py<cr>
imap <C-K> <c-o>:py3f /usr/share/clang/clang-format.py<cr>
"au BufWrite * :Autoformat

"============ LaTeX & Markdown =============
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'

" MarkdownPreview
let g:mkdp_auto_start = 1

" Vimtex
let g:tex_flavor = 'latex'

" ============== AsciiDoctor ==============
let g:asciidoctor_executable = 'asciidoctor -b html5' " What to use for HTML, default `asciidoctor`.
let g:asciidoctor_extensions = ['asciidoctor-diagram', 'asciidoctor-rouge' ] " What extensions to use for HTML, default `[]`.
"let g:asciidoctor_executable = 'asciidoctor-latex -b html' " What to use for HTML, default `asciidoctor`.
"let g:asciidoctor_extensions = ['asciidoctor-diagram', 'asciidoctor-rouge', 'asciidoctor-latex' ] " What extensions to use for HTML, default `[]`.

""" AsciiDoctor PDF
let g:asciidoctor_pdf_executable = 'asciidoctor-pdf' " What to use for PDF, default `asciidoctor-pdf`.
let g:asciidoctor_pdf_extensions = ['asciidoctor-diagram'] " What extensions to use for PDF, default `[]`.

""" Folding
"let g:asciidoctor_folding = 1 " Fold sections, default `0`.
"let g:asciidoctor_fold_options = 1 " Fold options, default `0`.
let g:asciidoctor_folding = 0 " Fold sections, default `0`.
let g:asciidoctor_fold_options = 0 " Fold options, default `0`.

""" Syntax
" Conceal *bold*, _italic_, `code` and urls in lists and paragraphs, default `0`.
" See limitations in end of the README
let g:asciidoctor_syntax_conceal = 1

" Highlight indented text, default `1`.
let g:asciidoctor_syntax_indented = 0

""" Syntax Highlighting
" List of filetypes to highlight, default `[]`
let g:asciidoctor_fenced_languages = ['python', 'c', 'javascript']

""" Function mappings
" Function to create buffer local mappings and add default compiler
fun! AsciidoctorMappings()
    nnoremap <buffer> <leader>oo :AsciidoctorOpenRAW<CR>
    nnoremap <buffer> <leader>op :AsciidoctorOpenPDF<CR>
    nnoremap <buffer> <leader>oh :AsciidoctorOpenHTML<CR>
    nnoremap <buffer> <leader>ox :AsciidoctorOpenDOCX<CR>
    nnoremap <buffer> <leader>ch :Asciidoctor2HTML<CR>
    nnoremap <buffer> <leader>cp :Asciidoctor2PDF<CR>
    nnoremap <buffer> <leader>cx :Asciidoctor2DOCX<CR>
    nnoremap <buffer> <leader>p :AsciidoctorPasteImage<CR>
    " :make will build pdfs
    compiler asciidoctor2pdf
endfun

" Call AsciidoctorMappings for all `*.adoc` and `*.asciidoc` files
augroup asciidoctor
    au!
    au BufEnter *.adoc,*.asciidoc call AsciidoctorMappings()
augroup END

func! ConvertAsciidoctorToHTML()
    " Text file with asciidoctor contents?
    if &filetype == 'text' && getline(1) =~ '^= .*$'
        " text files have no asciidoctor commands
        set filetype=asciidoctor
        Asciidoctor2HTML
        set filetype=text
    elseif &filetype == 'asciidoctor'
        Asciidoctor2HTML
    endif
endfunc
augroup ON_ASCIIDOCTOR_SAVE | au!
    au BufWritePost *.adoc,*.txt call ConvertAsciidoctorToHTML()
augroup end


" ViM LSP
if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
                \ 'name': 'pyls',
                \ 'cmd': {server_info->['pyls']},
                \ 'allowlist': ['python'],
                \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

let g:LanguageClient_serverCommands = {
            \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
            \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
            \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
            \ 'python': ['/usr/local/bin/pyls'],
            \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
            \ 'java': ['~/.local/share/lsp/java-language-server/dist/lang_server_linux.sh'], 
            \ }

"let g:lsc_server_commands = {'java': '<path-to-java-language-server>/java-language-server/dist/lang_server_{linux|mac|windows}.sh'}
" note that if you are using Plug mapping you should not use `noremap` mappings.
nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
nmap <silent>K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> <F2> <Plug>(lcn-rename)
nmap <leader>cmp <Plug>(lcn-implementation)
"nmap <leader>cmp <Plug>(lcn-implementation)
nmap <leader>m :call LanguageClient_contextMenu()<CR>
