" Font
"set guifont=Monaco:h12.00
"set guifont=Menlo:h12.00

set guifont=Bitstream\ Vera\ Sans\ Mono:h12

" No audible bell
set vb

" Use console dialogs and that's it sucka
set guioptions=c

set lines=50 columns=200
set transparency=2

" Local config
if filereadable(".gvimrc.local")
  source .gvimrc.local
endif

if has("gui_macvim")
  "macmenu &File.New\ Tab key=<nop>
  "map <Leader>t <Plug>PeepOpen
end
