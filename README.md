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

Homemaker
----
https://github.com/FooSoft/homemaker

```
${HM_PATH} home/homemaker.tml home/
```

Homemaker will create symlink in the new home for each file specify in homemaker.tml


Weird color for fish in tmumx
----

Create an alias tmux = tmux -2

Or add this to .tmux.conf
set-option -g default-terminal "screen-256color"
