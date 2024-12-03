:let @a="I-\<Esc>Wi+\<Esc>j0"
:let N = 1000
:let @b="gg0" . N . "@a" . "\<Esc>"
::normal @b

:let @c="::.!bc \<C-M>j"
:let @d=N."@c"
::normal gg0 @d

" ::normal gg0
:let @e="A+ \<Esc>j"
:let @f=N-1."@e"
" ::normal @f

" ::normal gg0
:let @g=N."J"
" ::normal @g
" ::normal @c

