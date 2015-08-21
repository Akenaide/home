alias vali='vim ~/.bash_aliases && . ~/.bash_aliases'

alias vissh='vi ~/.ssh/config'
alias vigit='vi ~/.gitconfig'
alias viyay='vim /cygdrive/c/Users/KMS/Documents/task/yay.txt '
alias giyay='gvim /cygdrive/c/Users/KMS/Documents/task/yay.txt '

alias ll='ls -la'
alias lt='ls -ltra'
alias l='ls -CF'

fbuilds(){
   /c/Python27/Scripts/buildslave.bat "$@"  e:/work/buildslave/
}


alias builds=fbuilds
alias bbcc='buildbot checkconfig'

alias vi='/usr/bin/vim'

alias cdw='cd /cygdrive/e/work/'
alias cdw='cd /cygdrive/c/work/'
alias cdappb='cdw ; cd b_mg_app'
alias cdapp='cdw ; cd mg_app'
alias cdtoo='cdw; cd mhtools'
alias cdsi='cdw; cd mh_si'
alias cdsib='cdw; cd b_mh_si'
alias cdb='cdw; cd buildbot'
alias cdbs='cdw; cd buildslave'
alias cdh="cd /cygdrive/c/Users/Ake"
alias cdzim="cdh; cd Notebooks/zim"
alias cdp="cd /cygdrive/c/Python27/"

alias xt="xterm &"

alias gitb='git branch'
alias gitba='git branch -a'
alias gitco='git checkout'
alias gitci='git commit'
alias gitst='git status'
alias gitlog='git log --name-status'
alias gitsm='git submodule'
alias gitdiff='git diff'
alias gitdiffs='git diff --numstat'
alias gn='git number --column'
alias ga='git number add'
alias gitlt='git describe --tags `git rev-list --tags --max-count=3`'

alias more=less

alias gitka='gitk --all & :'


function cygwinagent() {
    searching=1
    my_uid=`id -u`
    # TESTED WITH CYGWIN. Might need changes for mingw
    while [ $searching = 1 ] ; do
        socks=`find /tmp/ssh-* -type s -uid $my_uid 2>/dev/null`
        if [ "$socks" != "" ] ; then
            socks=`ls -tr $socks | tail -n 1`
            echo "trying <$socks>"
            export SSH_AUTH_SOCK="$socks"
            export SSH_AGENT_PID=`ps axu | grep ssh-agent | grep -v grep | awk '{ print $1}'`
            error=0
            ssh-add -l > /dev/null 2>&1 || error=1
            if [ $error = 0 ] ; then # failed connecting to agent
                searching=0
            else
                echo 'socket seems dead. will remove it'
                rm -rf $socks
                rmdir `dirname $socks`
            fi
        else
            echo "creating new ssh agent"
            eval `ssh-agent`
            ssh-add
            ssh-add ~/.ssh/awesec2-pair.pem
            searching=0
        fi
    done
}

function mingwagent() {
    searching=1
    my_uid=`id -u`
    while [ $searching = 1 ] ; do
        socks=`find /tmp/ssh-* -type f -uid $my_uid 2>/dev/null`
        echo "SOCKS = $socks"
        if [ "$socks" != "" ] ; then
            socks=`ls -tr $socks | tail -n 1`
            echo "trying <$socks>"
            export SSH_AUTH_SOCK="$socks"
            export SSH_AGENT_PID=`ps axu | grep ssh-agent | grep -v grep | awk '{ print $1}'`
            error=0
            ssh-add -l > /dev/null 2>&1 || error=1
            if [ $error = 0 ] ; then # failed connecting to agent
                searching=0
            else
                echo 'socket seems dead. will remove it'
                rm -rf $socks
                rmdir `dirname $socks`
            fi
        else
            echo "creating new ssh agent"
            eval `ssh-agent`
            ssh-add
            searching=0
        fi
    done
}

alias agent=cygwinagent
if [ "$IS_MINGW" = 1 ] ; then
	donothing=0
	alias agent=mingwagent
        #" alias python='/c/Python27/python.exe'
else
	alias agent=cygwinagent

fi

# ############################################################################
# add user customisations of aliases / shell functions
# ############################################################################
if [ -f ~/.bash_aliases.local ]; then
    . ~/.bash_aliases.local
fi

