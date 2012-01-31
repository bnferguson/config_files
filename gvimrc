if has("gui_macvim")
  " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert

  " Command-T for CommandT
  macmenu &File.New\ Tab key=<D-T>
  map <D-t> :CommandT<CR>
  imap <D-t> <Esc>:CommandT<CR>

  " Command-Return for fullscreen
  macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>

  " Command-Shift-F for Ack
  map <D-F> :Ack<space>

  " Command-/ to toggle comments
  map <D-/> <plug>NERDCommenterToggle<CR>
  imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i


  " Command-][ to increase/decrease indentation
  vmap <D-]> >gv
  vmap <D-[> <gv

else
  " Ctrl-T for Command-T
  map <C-t> :CommandT<CR>
  imap <C-t> <Esc>:CommandT<CR>

  " Ctrl-Shift-F for Ack
  map <C-F> :Ack<space>

  " Alt-/ to toggle comments
  map <A-/> <plug>NERDCommenterToggle<CR>
  imap <A-/> <Esc><plug>NERDCommenterToggle<CR>i

  " Alt-][ to increase/decrease indentation
  vmap <A-]> >gv
  vmap <A-[> <gv
endif

" Adjust viewports to the same size
map <Leader>= <C-w>=
imap <Leader>= <Esc> <C-w>=

" Don't beep
set visualbell

" Start without the toolbar
set guioptions-=T

" Project Tree
if exists("loaded_nerd_tree")
  augroup AuNERDTreeCmd
  autocmd AuNERDTreeCmd VimEnter * call s:CdIfDirectory(expand("<amatch>"))
  autocmd AuNERDTreeCmd FocusGained * call s:UpdateNERDTree()
  autocmd AuNERDTreeCmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
endif

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

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

  if exists(":CommandTFlush") == 2
    CommandTFlush
  endif
endfunction

set guifont=Bitstream\ Vera\ Sans\ Mono

" No audible bell, no visual bell
set novb

" Use console dialogs and that's it sucka
set guioptions=c

set lines=50 columns=200

if has("gui_macvim")
  "macmenu &File.New\ Tab key=<nop>
  set vb

  set guifont=Bitstream\ Vera\ Sans\ Mono:h12
  set transparency=15

  if has("gui_running")
    set fuoptions=maxvert,maxhorz
    "au GUIEnter * set fullscreen
  endif
end

