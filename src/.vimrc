set is

if has("win32")
    se guifont=Consolas:h14:cANSI
    nmap <F5> :silent ! start "c:/Program Files/chrome/chrome.exe" "http://www.google.com/search?hl=en&btnI=I\%27m+Feeling+Lucky&q=site\%3Amsdn.microsoft.com\%20<cword>"<CR>
else
    se guifont=DejaVu\ Sans\ Mono\ 9 
    nmap <F5> :silent ! start "google-chrome" "http://www.google.com/search?hl=en&btnI=I\%27m+Feeling+Lucky&q=site\%3Amsdn.microsoft.com\%20<cword>"<CR>
endif
se lines=40
:set ch=2

""""""""""""""""NEW"""""""""""""""
filetype plugin on
"hi DiffAdd term=bold ctermbg=4 guibg=#d6ffb0
"hi DiffChange term=bold ctermbg=5 guibg=#f6e8d0
"hi DiffDelete term=bold cterm=bold ctermfg=4 ctermbg=6 gui=bold guifg=lightGray guibg=DarkGray
"hi DiffText term=reverse cterm=bold ctermbg=1 gui=bold guibg=#e3c1a5
"hi Comment ctermfg=DarkGrey guifg=DarkGreen guibg=LightGray
colors darkblue

"treat temporary cvs files as c/h for diff readability
au BufNewFile,BufRead *.c.* set syn=c
au BufNewFile,BufRead *.h.* set syn=c

set hlsearch
set number
set mousemodel=popup
set virtualedit=all
syntax on
set guioptions+=a
:set guicursor+=a:blinkon0
set tabstop=8
set shiftwidth=4
set softtabstop=4
set expandtab

" adding path of src
set path+=$JPWDSRC
set path+=$JPWDBIN

se smartindent

