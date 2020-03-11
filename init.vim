"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/fuelen/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/fuelen/.config/nvim/dein')
  call dein#begin('/home/fuelen/.config/nvim/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/fuelen/.config/nvim/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('wsdjeg/dein-ui.vim')
  " appearance
  call dein#add('KeitaNakamura/neodark.vim') " theme
  call dein#add('vim-airline/vim-airline')   " status bar
  call dein#add('lilydjwg/colorizer')        " highlight hex and rgb colors
  " core
  call dein#add('bkad/CamelCaseMotion')
  call dein#add('dkprice/vim-easygrep')
  call dein#add('preservim/nerdcommenter')
  call dein#add('direnv/direnv.vim')
  call dein#add('junegunn/fzf')
  call dein#add('junegunn/fzf.vim')
  call dein#add('Yggdroot/indentLine')       " prints vertical lines at each indentation level
  call dein#add('mhinz/vim-startify')        " start screen
  call dein#add('wsdjeg/vim-fetch')          " open files in file:line_number format from CLI
  call dein#add('tpope/vim-surround')        " for manipulation with quotes :)
  call dein#add('cohama/lexima.vim')         " auto close parentheses
  call dein#add('Chiel92/vim-autoformat')
  call dein#add('terryma/vim-multiple-cursors')
  call dein#add('AndrewRadev/switch.vim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/neco-syntax')
  call dein#add('vim-syntastic/syntastic')
  call dein#add('chrisbra/unicode.vim')
  call dein#add('easymotion/vim-easymotion')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('janko/vim-test')
  call dein#add('vim-scripts/utl.vim')
  call dein#add('itchyny/vim-cursorword')
  call dein#add('itchyny/calendar.vim')
  call dein#add('jceb/vim-orgmode')

  " git
  call dein#add('tpope/vim-fugitive')
  call dein#add('airblade/vim-gitgutter')

  " file manager
  call dein#add('scrooloose/nerdtree')
  call dein#add('Xuyuanp/nerdtree-git-plugin')

  " languages
  call dein#add('elixir-editors/vim-elixir')
  call dein#add('slashmili/alchemist.vim')
  call dein#add('HerringtonDarkholme/yats.vim') " typescript syntax
  call dein#add('idris-hackers/idris-vim')
  call dein#add('elmcast/elm-vim')
  call dein#add('neovimhaskell/haskell-vim')
  call dein#add('gleam-lang/gleam.vim')
  call dein#add('jparise/vim-graphql')
  call dein#add('vmchale/dhall-vim')
  call dein#add('purescript-contrib/purescript-vim')
  call dein#add('frigoeu/psc-ide-vim')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------


" ---------SETTINGS-----------------------
colorscheme neodark
let g:airline_theme='neodark'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1

" use git against backup files
set nobackup
set nowritebackup
set noswapfile

set autoread " autoreload files (when change branch on git)

set title " show filename in title
set scrolloff=3 " minimum indentation from top/bottom of screen to highlighted result on searching

set number " show numbers
set history=1000
set nowrap " disable wrapping strings (when they are very long)

" show spaces and tabs
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

set splitbelow splitright " where new split must be created
set hidden " allow hidden buffers
set colorcolumn=120
set cursorline " highlight whole line under cursor, but makes vim very slow
" set cursorcolumn

set undofile " undo changes between sessions

" set tab size
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab " replace tabs to spaces
set smarttab " only even number of spaces (3 spaces + tab = 4 spaces, 2 spaces + tab = 4 spaces)

set clipboard=unnamedplus " use system clipboard

set diffopt+=vertical

let g:deoplete#enable_at_startup = 1

"-----------------Mappings----------------------
" set leader button
let mapleader = ","
let g:mapleader = ","
" replace default search with search by regex
nnoremap / /\v
vnoremap / /\v

" search and highlight by selection
vnoremap <leader>h y/<C-R>"<CR>

set ignorecase

" Turn off arrow keys (this might not be a good idea for beginners, but it is
" the best way to ween yourself of arrow keys on to hjkl)
" http://yehudakatz.com/2010/07/29/everyone-who-tried-to-convince-me-to-use-vim-was-wrong/
" nnoremap <Left> :echoe "Use h"<CR>
" nnoremap <Right> :echoe "Use l"<CR>
" nnoremap <Up> :echoe "Use k"<CR>
" nnoremap <Down> :echoe "Use j"<CR>"
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>

" Map ESC
imap jj <ESC>

nmap <Tab> :bnext<CR>
nmap <C-Tab> :bprev<CR>

" navigate between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap \| :vsplit<CR>
nnoremap _ :split<CR>
" turn search highlight off
nnoremap <leader><space> :noh<cr>

map <leader>s :Grep<space>

" open file browser
map <leader>p :NERDTreeToggle<cr>
" set cursor in file browser on current file
map <C-f> :NERDTreeFind<cr>

" Easy commenting
map // <plug>NERDCommenterToggle
" navigate through autocomplete menu (Deoplete)
inoremap <C-k> <C-Up>
inoremap <C-j> <C-Down>

" Neosnippet key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-l>     <Plug>(neosnippet_expand_or_jump)
smap <C-l>     <Plug>(neosnippet_expand_or_jump)
xmap <C-l>     <Plug>(neosnippet_expand_target)

" use tab to navigate between holes in snippets
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
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
let g:switch_custom_definitions =
      \ [
      \   ['assert', 'refute'],
      \   ['and', 'or'],
      \ ]

" no comment :)
noremap === :Autoformat<CR>

" setup preview window for fuzzy finder
let $FZF_DEFAULT_OPTS='--preview "[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (highlight -O ansi -l {} || coderay {} || rougify {} || cat {}) 2> /dev/null | head -500"'
" shortkey for fuzzy finder
nnoremap <leader>z :FZF<CR>

nnoremap <leader>b :Buffers<CR>

" folding
set foldmethod=syntax
set foldlevelstart=99 " start unfolded

let $TERM='xterm'

" EasyGrep
let g:EasyGrepMode=0 " all files
let g:EasyGrepCommand=1 " grep instead of vimgrep
let g:EasyGrepRecursive=1
let g:EasyGrepSearchCurrentBufferDir=1
let g:EasyGrepIgnoreCase=1
let g:EasyGrepHidden=0
let g:EasyGrepBinary=0
let g:EasyGrepFilesToInclude=''
let g:EasyGrepFilesToExclude='*.swp,*~,*.beam,*webpack_bundle.js,*.worker.js,*.log,_build/,node_modules,erl_crash.dump,*.sql,coverage/,tmp/,.docker/,doc/'
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

" deoplete
let g:deoplete#complete_method = "omnifunc"
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.purescript = ['\w*']
let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#input_patterns.purescript = '[.\w]+'

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_elixir_checkers = ['elixir']
let g:syntastic_enable_elixir_checker = 0

" make test commands execute using dispatch.vim
let test#strategy = "neovim"
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

 "https://github.com/itchyny/vim-cursorword/issues/20
let g:cursorword_delay = 0
