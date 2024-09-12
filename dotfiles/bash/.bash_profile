#
# ~/.bash_profile
#

export HISTSIZE=500000
export HISTFILESIZE=-1


[[ -f ~/.bashrc ]] && . ~/.bashrc

[[ ${XDG_SESSION_TYPE} = "tty" ]] && [[ ${XDG_VTNR} = 1 ]] && [[ -f ~/startw ]] && ~/startw
