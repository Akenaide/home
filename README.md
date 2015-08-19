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

Vim plug
----
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
