:%w ! cut -d' ' -f1 | sort >l1.txt
:%w ! cut -d' ' -f2- | sort >l2.txt
:%! pr -tm -w 40 l1.txt l2.txt 

:let @a="I\<Esc>Wi-\<Esc>j0"
:let N = 1000
:let @b="gg0" . N . "@a" . "\<Esc>"
::normal @b

:let @c="::.!bc \<C-M>j"
:let @d=N."@c"
::normal gg0 @d

:let @e="A+ \<Esc>j"
:let @f=N-1."@e"
::normal gg0
::normal @f
:%s/+//g
:%s/-//g
::normal gg0
::normal @f

::normal gg0
:let @g=N."J"
::normal @g
::normal @c

