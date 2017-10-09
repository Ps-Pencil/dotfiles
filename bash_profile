#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH=$PATH:/bin:/opt/google/chrome/:~/go/bin

if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
	  exec startx
fi

# start ssh-agent
SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    for f in $(ls ~/.ssh/*.pub); do
        ssh-add "${f%.pub}";
    done
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

# running this here instead of .xinitrc because .xinitrc is not sourced when system returns from hibernation.
xset r rate 250 60 &
xset b off

export GOPATH=$HOME/go

# OPAM configuration
. /home/pspencil/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
