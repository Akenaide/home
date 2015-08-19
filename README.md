Fzf in babun / cygwin
----
We need a little hack because fzf return file path with windows's file separator.

We shoud add this line :
```
line.gsub! '\\', '/' 
```

 in `format` function, line 466 (may change)


TagBar reqs
----
Download : http://ctags.sourceforge.net/

Steps : 
```
./configure
make
mv to $PATH
```
