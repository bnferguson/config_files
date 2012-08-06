" Fullscreen takes up entire screen
set fuoptions=maxhorz,maxvert

" Command-T for CtrlP
macmenu &File.New\ Tab key=<D-T>
map <D-t> :CtrlP<CR>
imap <D-t> <Esc>:CtrlP<CR>

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

if has("gui_macvim")
  "macmenu &File.New\ Tab key=<nop>
  set vb

  " requires NERDTree
  nmap <D-d> :NERDTreeToggle<CR>

  set guifont=Bitstream\ Vera\ Sans\ Mono:h12
  set transparency=0

  if has("gui_running")
    set fuoptions=maxvert,maxhorz
    "au GUIEnter * set fullscreen
  endif
end

