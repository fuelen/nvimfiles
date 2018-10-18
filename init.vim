"NeoBundle Scripts-----------------------------
set runtimepath+=/home/fuelen/.config/nvim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('/home/fuelen/.config/nvim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" colorscheme & syntax highlighting
NeoBundle 'KeitaNakamura/neodark.vim'
NeoBundle 'Yggdroot/indentLine'        " prints vertical lines at each indentation level
NeoBundle 'Raimondi/delimitMate'       " automatic closing of quotes
NeoBundle 'Valloric/MatchTagAlways'    " highlight XML/HTML tags that enclose your cursor location
NeoBundle 'lilydjwg/colorizer'         " highlight colors in css files
NeoBundle 'chemzqm/vim-jsx-improve'
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'slashmili/alchemist.vim'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'joker1007/vim-ruby-heredoc-syntax'
NeoBundle 'kchmck/vim-coffee-script'    " I don't need coffee, but plugin above needs this
NeoBundle 'direnv/direnv.vim'
NeoBundle 'janko-m/vim-test'
NeoBundle 'bkad/CamelCaseMotion'
" NeoBundle 'ternjs/tern_for_vim', { 'build': { 'unix': 'npm install tern' }}
" NeoBundle 'rhysd/vim-grammarous'        " Grammar checker based on LanguageTool
" NeoBundle 'ryanoasis/vim-devicons'
" NeoBundle 'elzr/vim-json'

" Git
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'

" File Manager
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'

" Utils
NeoBundle 'bling/vim-airline'      " status-bar
NeoBundle 'tpope/vim-surround'     " for manipulation with quotes :)
NeoBundle 'tomtom/tcomment_vim'    " commenter
NeoBundle 'AndrewRadev/switch.vim' " useful switcher
NeoBundle 'Chiel92/vim-autoformat' " + install ruby-beautify gem
NeoBundle 'dkprice/vim-easygrep'   " Fast and Easy Find and Replace Across Multiple Files
" NeoBundle 'w0rp/ale'               " Syntax checker
NeoBundle 'ngmy/vim-rubocop'       " code-style checker for ruby
NeoBundle 'Shougo/deoplete.nvim'   " autocompletion plugin (NeoVim)
NeoBundle 'Shougo/neco-vim'        "  search in source for deoplete
NeoBundle 'Shougo/neoinclude.vim'  " search in included files for deoplete
NeoBundle 'Shougo/neco-syntax'     " search in syntax for deoplete
NeoBundle 'tpope/vim-endwise'      " autocomplete ruby blocks
NeoBundle 'junegunn/fzf'           " fuzzy finder
NeoBundle 'haya14busa/vim-open-googletranslate'
NeoBundle 'tyru/open-browser.vim'  " dependency for vim-open-googletranslate
NeoBundle 'chrisbra/csv.vim'       " csv editor and viewer
NeoBundle 'neovimhaskell/haskell-vim'

NeoBundle 'mhinz/vim-startify' " Startup window

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

"------------------Settings--------------------

syntax enable

colorscheme neodark
let g:airline_theme='neodark'
let g:airline_powerline_fonts=1
" use git against backup files
set nobackup
set nowritebackup
set noswapfile

set autoread " autoreload files (when change branch on git)

set title " show filename in title
set scrolloff=3 " minimum indentation from top/bottom of screen to highlighted result on searching

set number " show numbers
set history=1000
set nowrap " disable wrapping strings (when they very long)

" show spaces and tabs
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

" autocmd FileType nerdtree setlocal nolist
" let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
" let g:WebDevIconsUnicodeGlyphDoubleWidth = 0

set splitbelow splitright " where new split must be created
set hidden " allow hidden buffers
set colorcolumn=110 " width like on github
set cursorline " highlight whole line under cursor, but makes vim very slow

set undofile " undo changes between sessions

" set tab size
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab " replace tabs to spaces
set smarttab " only even number of spaces (3 spaces + tab = 4 spaces, 2 spaces + tab = 4 spaces)

set clipboard=unnamedplus " use system clipboard

" enable autocomplete
let g:deoplete#enable_at_startup = 1

"-----------------Mappings----------------------
" set leader button
let mapleader = ","
let g:mapleader = ","
" replace default search with search by regex
nnoremap / /\v
vnoremap / /\v
set ignorecase

" Turn off arrow keys (this might not be a good idea for beginners, but it is
" the best way to ween yourself of arrow keys on to hjkl)
" http://yehudakatz.com/2010/07/29/everyone-who-tried-to-convince-me-to-use-vim-was-wrong/
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>"
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Map ESC
imap jj <ESC>
" move between splits by tab
nnoremap <Tab> <C-w>w

" navigate between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" turn search highlight off
nnoremap <leader><space> :noh<cr>

map <leader>s :Grep 
" open file browser
map <leader>p :NERDTreeToggle<cr>
" set cursor in file browser on current file
map <C-f> :NERDTreeFind<cr>

" Easy commenting
nnoremap // :TComment<CR>
vnoremap // :TComment<CR>

" open selected text in browser
vnoremap <leader>t :OpenGoogleTranslate<CR>

" navigate through autocomplete menu (Deoplete)
inoremap <C-k> <C-Up>
inoremap <C-j> <C-Down>

" CamelCaseMotion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

" switch on -
let g:switch_mapping = "-"

" no comment :)
noremap === :Autoformat<CR>

" setup preview window for fuzzy finder
let $FZF_DEFAULT_OPTS='--preview "[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (highlight -O ansi -l {} || coderay {} || rougify {} || cat {}) 2> /dev/null | head -500"'
" shortkey for fuzzy finder
nnoremap z :FZF<CR>

" set custom config file for RuboCop
let g:vimrubocop_config = '~/.config/nvim/rubocop.yml'

" add tags highlighting to js
let g:mta_filetypes = {
      \ 'html' : 1,
      \ 'xhtml' : 1,
      \ 'xml' : 1,
      \ 'jinja' : 1,
      \ 'javascript' : 1,
      \}

let $TERM='xterm'

let g:EasyGrepMode=0 " all files
let g:EasyGrepCommand=1 " grep instead of vimgrep
let g:EasyGrepRecursive=1
let g:EasyGrepSearchCurrentBufferDir=1
let g:EasyGrepIgnoreCase=1
let g:EasyGrepHidden=0
let g:EasyGrepBinary=0
let g:EasyGrepFilesToInclude=''
let g:EasyGrepFilesToExclude='*.swp,*~,*.beam,*webpack_bundle.js,*.worker.js,*.log,_build/,node_modules,erl_crash.dump,*.sql,coverage/,tmp/,.docker/'
let g:EasyGrepAllOptionsInExplorer=1
let g:EasyGrepWindow=0
let g:EasyGrepReplaceWindowMode=0
let g:EasyGrepOpenWindowOnMatch=1
let g:EasyGrepEveryMatch=0
let g:EasyGrepJumpToMatch=1
let g:EasyGrepInvertWholeWord=0
let g:EasyGrepPatternType='regex'
let g:EasyGrepFileAssociationsInExplorer=0
let g:EasyGrepExtraWarnings=0
let g:EasyGrepOptionPrefix='<leader>vy'
let g:EasyGrepReplaceAllPerFile=0

" use system languagetool instead of downloading new
" let g:grammarous#languagetool_cmd = 'languagetool'

" for json quotes
let g:indentLine_concealcursor=""

" set default working directory, don't enable if you want to
" use alchemist.vim
" cd ~/projects

" https://github.com/phoenixframework/phoenix/issues/1165
" Settings for Ale
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_sign_column_always = 1
" let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
" let g:ale_javascript_eslint_executable = 'eslint_d'
" let g:ale_sign_error = '✗'
" let g:ale_sign_warning = '⚠'
"
" augroup AleGroup
"   autocmd!
"   autocmd User ALELint call TouchOpenFile()
" augroup END
"
" func! TouchOpenFile()
"   let g:ale_enabled = 0
"   sleep 500m
"   w
"   let g:ale_enabled = 1
" endfunc
