""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim plug                                                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')
" Plug 'AlessandroYorba/Libertine'
Plug 'morhetz/gruvbox'
Plug 'sonph/onehalf', {'rtp': 'vim'}
" Plug 'mswift42/vim-themes'
" Plug 'rafi/awesome-vim-colorschemes'
" Plug 'rdavison/kimbie-vim'
" Plug 'reasonml-editor/vim-reason-plus'
Plug 'NLKNguyen/papercolor-theme'
Plug 'airblade/vim-gitgutter'
Plug 'effkay/argonaut.vim'
Plug 'godlygeek/tabular'
Plug 'hashivim/vim-terraform'
Plug 'majutsushi/tagbar'
Plug 'neomake/neomake'
Plug 'ntpeters/vim-better-whitespace'
Plug 'rdavison/LanguageClient-neovim', {'do': ':UpdateRemotePlugins'}
Plug 'rdavison/nova.vim'
Plug 'rgrinberg/vim-ocaml'
Plug 'roxma/nvim-completion-manager'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
"Plug 'vim-syntastic/syntastic'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python runtime for vim                                                       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:python2_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic settings                                                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cursorline      " highlight the line the cursor is on
set smartindent     " smart indenting when starting new lines
set softtabstop=2   " number of spaces that a <Tab> counts for while editing
set tabstop=2       " number of spaces that a <Tab> counts for
set shiftwidth=2    " number of spaces to shift
set expandtab       " prefer spaces over tabs
set smarttab        " enable smart tabs
set number          " show line numbers
set hlsearch        " highlight search results
set incsearch       " incrementally search
set nowrap          " do not wrap when text goes off screen
set mouse=ncr       " enable mouse for normal, insert, and hit-enter/more-prompt modes
set virtualedit=all " allows the cursor to float anywhere on the screen
set termguicolors   " enable much better color support
set backspace=2     " better backspace support than the default
set colorcolumn=80  " draw a line at the 80 character mark
set hidden          " keep a buffer even when it is abandoned
set ruler           " show information about where the cursor is
set completeopt=menuone,longest,preview " show the completion window
syntax on           " read syntax files

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color schemes                                                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gruvbox_contrast_dark = 'hard'
let g:alduin_Shout_Dragon_Aspect = 1
let g:alduin_Shout_Become_Ethereal = 1
let g:alduin_Shout_Fire_Breath = 1
let g:libertine_Twilight = 1
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default.dark': {
  \       'override' : {
  \         'color00' : ['#000000', '232'],
  \         'linenumber_bg' : ['#000000', '232']
  \       }
  \     }
  \   }
  \ }

set background=light
"color nova
color onehalflight
let g:airline_theme='onehalfdark'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Keybindings                                                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set the leader keys to commas
let mapleader=","
let maplocalleader=",,"

" Allows me to type jj instead always having to reach up to the ESC button
imap jj <Esc>

" Easier moving around windows
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l
" nnoremap <C-S> :sp<CR>
" nnoremap <C-_> :vsp<CR>
" nnoremap <C-Q> :q<CR>
" nnoremap <C-W> :w<CR>
" nnoremap <localleader>w <C-W>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LanguageClient                                                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Config
let g:LanguageClient_diagnosticsEnable = 0
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
  \ 'reason': ['ocaml-language-server', '--stdio'],
  \ 'ocaml': ['ocaml-language-server', '--stdio'],
  \ }

" Keymap
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> <localleader>b :TagbarToggle<CR>
nnoremap <silent> <localleader>h :MerlinDestruct<CR>
nnoremap <silent> <localleader>? :MerlinDocument<CR>
nnoremap <silent> <localleader>y :MerlinYankLatestType<CR>
nnoremap <silent> <localleader>l :MerlinClearEnclosing<CR>

" Use tab for autocomplete
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

" Enter closes the autocomplete window and starts a new line
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic                                                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_ocaml_checkers = ['merlin']
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_jump =  0
let g:syntastic_aggregate_errors = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OCaml                                                                        "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
