
set -x PYTHONSTARTUP  $HOME/.pythonrc.py
set -x MHCLIENT_PLATFORM mhsi
set -x GOPATH ~/go
set -x FZF_DEFAULT_COMMAND  "pt -l -g ."
set -x FZF_CTRL_T_COMMAND  "pt -l -g ."
set -x WORK ~/work
set -x TERM "xterm-256color"

# To compile python with dynamic, madatory for Youcompleteme
set -x PYTHON_CONFIGURE_OPTS "--enable-shared"

set PATH $HOME/.fzf/bin $HOME/bin $GOPATH/bin /opt/go/bin /opt/dart/bin $PATH

# status --is-interactive; and . (pyenv init -|psub)
# status --is-interactive; and . (pyenv virtualenv-init -|psub)


echo (which source)
# source /www/mh_si/rls/env/bin/activate.fish

# content has to be in .config/fish/config.fish
# if it does not exist, create the file
setenv SSH_ENV $HOME/.ssh/environment

function start_agent
    echo "Initializing new SSH agent ..."
    ssh-agent -c | sed 's/^echo/#echo/' > $SSH_ENV
    echo "succeeded"
    chmod 600 $SSH_ENV
    . $SSH_ENV > /dev/null
    ssh-add
end

function test_identities
    ssh-add -l | grep "The agent has no identities" > /dev/null
    if [ $status -eq 0 ]
        ssh-add
        if [ $status -eq 2 ]
            start_agent
        end
    end
end

if [ -n "$SSH_AGENT_PID" ]
    ps -ef | grep $SSH_AGENT_PID | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
        test_identities
    end
else
    if [ -f $SSH_ENV ]
        . $SSH_ENV > /dev/null
    end
    ps -ef | grep $SSH_AGENT_PID | grep -v grep | grep ssh-agent > /dev/null
    if [ $status -eq 0 ]
        test_identities
    else
        start_agent
    end
end
