set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" Display colors for color codes
Plugin 'chrisbra/Colorizer'

" Color Scheme
Plugin 'altercation/vim-colors-solarized'

" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" NERDTree
Plugin 'scrooloose/nerdtree'

" Preview the effect of replace in real time.
Plugin 'osyo-manga/vim-over'

" Go plugin
Plugin 'fatih/vim-go'

" CtrlP
Plugin 'kien/ctrlp.vim'
"
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'

" Automatically create directories
Plugin 'pbrisbin/vim-mkdir'

" Delimiter
Plugin 'jiangmiao/auto-pairs'

" Go autocomplete
Plugin 'nsf/gocode', {'rtp': 'vim/'}

" YouCompleteMe
Plugin 'Valloric/YouCompleteMe'

Plugin 'majutsushi/tagbar'

Plugin 'tpope/vim-surround'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'benmills/vimux'
Plugin 'mileszs/ack.vim'
Plugin 'lervag/vimtex'
Plugin 'SirVer/ultisnips'

Plugin 'tpope/vim-commentary'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Just for interop of YCM and Ultisnips
" Plugin 'ervandew/supertab'

Plugin 'vim-syntastic/syntastic'

Plugin 'jceb/vim-orgmode'

Plugin 'rhysd/vim-clang-format'
Plugin 'kana/vim-operator-user'

Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'airblade/vim-rooter'

Plugin 'sbdchd/neoformat'

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

" Syntax highlighting
syntax on

" Color scheme
set background=dark
colorscheme solarized

" Allow switching away from modified buffers
set hidden

" NERDTree's File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" Remap Esc in insert mode and command mode
imap fd <Esc>
map fd <Esc>
cnoremap fd <c-c>

" Leader key as space
let mapleader = " "
let maplocalleader = ","

nnoremap <SPACE> <Nop>

" NERDTree toggle
map <Leader>t :NERDTreeToggle<CR>

" vim-over
map <Leader>s :OverCommandLine<CR>

" Saving file
map <Leader>fs :w<CR>
map <Leader>fS :w !sudo tee %<CR>l
map <Leader>fr :CtrlPMRUFiles<CR>

" Fast edit vimrc
map <Leader>v :e ~/.vim/vimrc.vim<CR>

" Alternate buffer
map <Leader><Tab> :e #<CR>

" CtrlP
" let g:ctrlp_cmd = 'CtrlPMixed'

" goimports
let g:go_fmt_command = "goimports"

" Preventing pileup
augroup customized
    autocmd!
augroup end

" window shortcut
nnoremap <silent> vv <C-w>v
nnoremap <silent> vS <C-w>S
nnoremap <silent> vc <C-w>c
nnoremap <silent> vq <C-w>q

" Prompt for a command to run
function! CdAndRunCommand(...)
  let command = a:0 == 1 ? a:1 : ""
  let l:command = input(_VimuxOption("g:VimuxPromptString", "Command? "), command)
  call VimuxRunCommand("cd ".shellescape(expand('%:p:h'), 1))
  call VimuxRunCommand(l:command)
endfunction
function! Cd()
  call VimuxRunCommand("cd ".shellescape(expand('%:p:h'), 1))
endfunction
command! -nargs=? CdAndRunCommand :call CdAndRunCommand(<args>)
map <Leader>cp :CdAndRunCommand<CR>
map <Leader>cl :VimuxRunLastCommand<CR>
map <Leader>' :call Cd()<CR>

" visual line
nmap j gj
nmap k gk

" Close buffer
map <Leader>bd :bd<CR>

" YCMD
let g:ycm_server_python_interpreter = '/usr/bin/python2'

" ASCII symbols
let g:airline_symbols_ascii = 1

" CtrlP custom map
" let g:ctrlp_prompt_mappings = {
" 			\ 'PrtExit()':            ['<esc>', '<c-c>', '<c-g>', 'fd'],
" 			\ }

" tabwidth
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" This isn't there by default
autocmd customized Filetype tex let b:AutoPairs = g:AutoPairs | let b:AutoPairs['$'] = '$'

" vim-surround. More used to s
vmap s S

" Use system clipboard
set clipboard=unnamedplus

let g:UltiSnipsExpandTrigger="<c-j>"


nmap <c-b> :Buffers<cr>
map <Leader>sb :Lines<cr>
map <Leader>ss :BLines<cr>

" if executable('rg')
"   set grepprg=rg\ --color=never
"   let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
"   let g:ctrlp_use_caching = 0
" elseif executable('ag')
"     let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
"                 \ --ignore .git
"                 \ --ignore .hg
"                 \ --ignore "**/*.pyc"
"                 \ --ignore .svn
"                 \ -g ""'
" endif

set grepprg=rg\ --vimgrep

" syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Find using rg
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
map <Leader>sf :Find<cr>

" First find a git repo. If not, fall back to Files.
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()

" fzf
map <c-p> :ProjectFiles<cr>

" avoid conflict
let g:ctrlp_map = '<c-t>'
map <c-t> :CtrlP<CR>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" put swp files in vim
set directory=$HOME/tmp/vimswap

map <Leader>j :TagbarToggle<cr>

" Jump to definition
map <localleader>d :MerlinLocate<cr>

let g:syntastic_ocaml_checkers = ['merlin']

" No plaintex pls
let g:tex_flavor = "latex"

set ignorecase smartcase

" go tabwidth
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4

" Highlight cursor line. Line number
set cursorline number

" Change cursor shape in different modes
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" #### Some cool optional stuff
fun! OCaml_additional()
    " For the plugin 'tpope/vim-commentary':
    set commentstring=(*\ %s\ *)
endfun
autocmd FileType ocaml call OCaml_additional()
autocmd FileType ocaml set textwidth=80 | set colorcolumn=+1

autocmd FileType matlab setlocal commentstring=%\ %s

autocmd BufWrite *.cc,*.cpp :ClangFormat

let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_cpp_checkers = ['clang_check']
let g:syntastic_cpp_clang_check_args = '-extra-arg="-std=c++11 -stdlib=libc++"'
let g:ycm_show_diagnostics_ui = 0

" Remove trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

" Syntastic and Gradle
let g:syntastic_java_checkers=['javac']
let g:syntastic_java_javac_config_file_enabled = 1

" Java stuff
autocmd FileType java setlocal omnifunc=javacomplete#Complete
nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
nmap <F5> <Plug>(JavaComplete-Imports-Add)
imap <F5> <Plug>(JavaComplete-Imports-Add)
nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
imap <F6> <Plug>(JavaComplete-Imports-AddMissing)
nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)

let g:rooter_patterns = ['Makefile', '.git', '.git/', 'build.gradle']

autocmd FileType *.j setlocal textwidth=0

augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
