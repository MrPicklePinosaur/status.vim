" Title:        status.vim
" Description:  pinosaur's lightweight vim status bar
" Last Change:  8 November 2021
" Maintainer:   MrPicklePinosaur

if exists("g:loaded_statusvim")
    finish
endif
let g:loaded_status_vim = 1

autocmd BufEnter * call ReloadBar()
autocmd BufWritePost <buffer> call ReloadBar()

set laststatus=2
set statusline=
set statusline+=%{ReloadBar()}
set statusline+=%1*\ | 
set statusline+=%0*
if has('nvim')
    set statusline+=\ nvim
else
    set statusline+=\ vim
endif
set statusline+=\ \[%{mode()}\]
set statusline+=\[%{BufCount()}\]
set statusline+=\ %1*\ %{expand('%:~:.')}\ %m
set statusline+=%=
set statusline+=%y
set statusline+=\ %0*
set statusline+=\ %r\[%{v:register}\]
set statusline+=\ %{SpaceOrTab()}:%{TabstopValue()}
set statusline+=\ %l/%L:%c\ |
set statusline+=%1*\ |

