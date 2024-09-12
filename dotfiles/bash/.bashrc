#
# ~/.bashrc
#

export PATH="$PATH:~/.local/bin/:~/.config/emacs/bin/:~/scripts/desktop:~/scripts/wayland:~/go/bin:~/scripts/:~/.config/scripts"
export EDITOR="nvim"
export VISUAL="emacsclient -nw"
export LESSCHARSET="utf-8"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source /usr/share/fzf/completion.bash
source /usr/share/fzf/key-bindings.bash

#ranger() {
#    if [ -z "$RANGER_LEVEL" ]; then
#        /usr/bin/ranger "$@"
#    else
#        exit
#    fi
#}


# ssh agent is managed by openssh systemd user unit
if [[ -z "${SSH_CONNECTION}" ]]; then
    export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
fi


#ssh agent
#if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    #ssh-agent -t 2h > "$XDG_RUNTIME_DIR/ssh-agent.env"
#fi
#if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
    #source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
#fi

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias zathura='setsid zathura'
eval "$(zoxide init bash)"
alias cd=z

eval "$(starship init bash)"
