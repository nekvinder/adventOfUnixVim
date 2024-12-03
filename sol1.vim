function! Flash()
    set cursorline cursorcolumn
    redraw
    sleep 5m
    set nocursorline nocursorcolumn
endfunction

:call Flash()
:%w ! cut -d' ' -f1 | sort >l1.txt
:%w ! cut -d' ' -f2- | sort >l2.txt
:%! pr -tm -w 40 l1.txt l2.txt 
:call Flash()

:let @p="::call Flash()\<C-M>"

:let @a="@p I\<Esc>Wi-\<Esc>j0"
:let N = 1000
:let @b="gg0" . N . "@a" . "\<Esc>"
::normal @b

:let @c="@p ::.!bc \<C-M>j"
:let @d=N."@c"
::normal gg0 @d

:let @e="@p A+ \<Esc>"
:let @f=N-1."@e"
::normal gg0
::normal @f
:%s/+//g
:%s/-//g
::normal gg0
::normal @f

::normal gg0
:let @g="@p ".N."J"
::normal @g
::normal 0 @c

