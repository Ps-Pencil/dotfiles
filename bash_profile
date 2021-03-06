#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH=$PATH:/bin:/opt/google/chrome/:~/go/bin:~/matlab/bin

if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] \
    && [ -z "$TMUX" ]; then
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

if [[ -z "$TMUX" ]]; then
    xset r rate 250 60 &
    xset b off
fi

export GOPATH=$HOME/go

# OPAM configuration
. /home/pspencil/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# Save and reload the history after each command finishes
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history

export IGNORE_WINDOW_CHECK=1
export UDM_PLAY_SOUND=1
export LONG_RUNNING_IGNORE_LIST="man less emacs vim gdb utop"

alias e="emacsclient -c"

export PATH=$PATH":~/bin"

PATH="/home/pspencil/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/pspencil/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/pspencil/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/pspencil/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/pspencil/perl5"; export PERL_MM_OPT;

# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'


source /etc/profile.d/undistract-me.sh
