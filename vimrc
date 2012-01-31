call pathogen#infect()

set nocompatible

set number
set ruler
syntax on

" Set encoding
set encoding=utf-8

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Status bar
set laststatus=2

" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways

" NERDTree configuration
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>

" Command-T configuration
let g:CommandTMaxHeight=20

" ZoomWin configuration
map <Leader><Leader> :ZoomWin<CR>

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

function s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=72
endfunction

function s:setupMarkup()
  call s:setupWrapping()
  map <buffer> <Leader>p :Hammer<CR>
endfunction

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

au BufRead,BufNewFile *.txt call s:setupWrapping()

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" gist-vim defaults
if has("mac")
  let g:gist_clip_command = 'pbcopy'
elseif has("unix")
  let g:gist_clip_command = 'xclip -selection clipboard'
endif
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" Use modeline overrides
set modeline
set modelines=10

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement = 1

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1


" Show (partial) command in the status line
set showcmd

if has("gui_running")
  " Automatically resize splits when resizing MacVim window
  autocmd VimResized * wincmd =
endif

" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

cmap w!! %!sudo tee > /dev/null %

" http://stevelosh.com/blog/2010/09/coming-home-to-vim/#making-vim-more-useful
nnoremap j gj
nnoremap k gk

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

imap <C-l> <Space>=><Space>

nmap <leader>v :vsplit<CR> <C-w><C-w>
nmap <leader>s :split<CR> <C-w><C-w>

nnoremap ; :

" Don't use Ex mode, use Q for formatting
map Q gq

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor
endif

nmap <D-]> >>
vmap <D-]> >>
imap <D-]> <C-O>>>

nmap <D-[> <<
vmap <D-[> <<
imap <D-[> <C-O><<

" requires NERDTree
nmap <D-d> :NERDTreeToggle<CR>

" Default gui color scheme
color ir_black

" Leader shortcuts for Rails commands
" map <Leader>m :Rmodel
" map <Leader>c :Rcontroller
" map <Leader>v :Rview
" map <Leader>u :Runittest
" map <Leader>f :Rfunctionaltest
" map <Leader>tm :RTmodel
" map <Leader>tc :RTcontroller
" map <Leader>tv :RTview
" map <Leader>tu :RTunittest
" map <Leader>tf :RTfunctionaltest
" map <Leader>sm :RSmodel
" map <Leader>sc :RScontroller
" map <Leader>sv :RSview
" map <Leader>su :RSunittest
" map <Leader>sf :RSfunctionaltest


" settings for VimClojure
let g:vimclojure#HighlightBuiltins=1   " Highlight Clojure's builtins
let g:vimclojure#ParenRainbow=1        " Rainbow parentheses'!
let g:vimclojure#DynamicHighlighting=1 " Dynamically highlight functions
let vimclojure#NailgunClient="/usr/local/bin/ng" " Nailgun location
let vimclojure#WantNailgun=1
let vimclojure#SplitPos = "right"

let g:slimv_swank_cmd = '!osascript -e "tell application \"Terminal\" to do script \"sbcl --load ~/.vim/tmp/slimv/slime/start-swank.lisp\""'
map <Leader>fd :call SlimvEvalDefun()
map <Leader>fb :call SlimvEvalBuffer()
map <Leader>fr :call SlimvEvalRegion()
