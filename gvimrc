
" Command-T for CtrlP
map <D-t> :CtrlP<CR>
imap <D-t> <Esc>:CtrlP<CR>


" Command-Shift-F for Ack
map <D-F> :Ack<space>

" Command-/ to toggle comments
map <D-/> <plug>NERDCommenterToggle<CR>
imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i

" Command-][ to increase/decrease indentation
vmap <D-]> >gv
vmap <D-[> <gv

" Adjust viewports to the same size
map <Leader>= <C-w>=
imap <Leader>= <Esc> <C-w>=

" Start without the toolbar
set guioptions-=T

set guifont=Bitstream\ Vera\ Sans\ Mono

" No audible bell, no visual bell
set novb

" Use console dialogs and that's it sucka
set guioptions=c

"set lines=50 columns=200

" Project Tree
augroup AuNERDTreeCmd
autocmd AuNERDTreeCmd VimEnter * call s:CdIfDirectory(expand("<amatch>"))
autocmd AuNERDTreeCmd FocusGained * call s:UpdateNERDTree()

" If the parameter is a directory, cd into it
function s:CdIfDirectory(directory)
  let explicitDirectory = isdirectory(a:directory)
  let directory = explicitDirectory || empty(a:directory)

  if explicitDirectory
    exe "cd " . fnameescape(a:directory)
  endif

  " Allows reading from stdin
  " ex: git diff | mvim -R -
  if strlen(a:directory) == 0
    return
  endif

  if directory
    NERDTree
    wincmd p
    bd
  endif

  if explicitDirectory
    wincmd p
  endif
endfunction

" NERDTree utility function
function s:UpdateNERDTree(...)
  let stay = 0

  if(exists("a:1"))
    let stay = a:1
  end

  if exists("t:NERDTreeBufName")
    let nr = bufwinnr(t:NERDTreeBufName)
    if nr != -1
      exe nr . "wincmd w"
      exe substitute(mapcheck("R"), "<CR>", "", "")
      if !stay
        wincmd p
      end
    endif
  endif
endfunction


if has("gui_macvim")
  "macmenu &File.New\ Tab key=<nop>
  set vb

  macmenu &File.New\ Tab key=<D-T>

  " Command-Return for fullscreen
  macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>

  " requires NERDTree
  nmap <D-d> :NERDTreeToggle<CR>

  set guifont=Bitstream\ Vera\ Sans\ Mono:h12
  set transparency=0

  if has("gui_running")
    set fuoptions=maxvert,maxhorz
  endif
end

if has("gui_running")
  set lines=999
  set columns=999
endif

