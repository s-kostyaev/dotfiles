# менюшку нам для астокомплита
#zstyle ':completion:*' menu yes select
#source /etc/zsh_command_not_found
bindkey '\e[3~' delete-char # del
bindkey ';5D' backward-word # ctrl+left 
bindkey ';5C' forward-word #ctrl+right

autoload -U compinit promptinit
compinit
promptinit;

if [[ $EUID == 0 ]] 
then
PROMPT=$'%{\e[1;31m%}%n %{\e[1;34m%}%~ #%{\e[0m%} ' # user dir %
else
PROMPT=$'%{\e[1;32m%}%n %{\e[1;34m%}%~ %#%{\e[0m%} ' # root dir #
fi
RPROMPT=$'%{\e[1;34m%}%T%{\e[0m%}' # right prompt with time

alias ls='ls --color=auto'
alias grep='grep --colour=auto'

case $TERM in (xterm*|rxvt)
precmd () { print -Pn "\e]0;%n@%m: %~\a" }
preexec () { print -Pn "\e]0;%n@%m: $1\a" }
;;
esac
export LESS_TERMCAP_mb=$'\E[01;31m'       # начала мигающего
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # начало жирного текста
export LESS_TERMCAP_me=$'\E[0m'           # окончание
export LESS_TERMCAP_so=$'\E[38;5;246m'    # начала текста в инфобоксе
export LESS_TERMCAP_se=$'\E[0m'           # конец его
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # начало подчеркнутого
export LESS_TERMCAP_ue=$'\E[0m'           # конец подчеркнутого
ccopy(){ cp $1 /tmp/ccopy.$1; }
alias cpaste="ls /tmp/ccopy.* | sed 's|/tmp/ccopy.||' | xargs -I % mv /tmp/ccopy.% ./%" 
alias -g ERR='2>>( sed -ue "s/.*/$fg_bold[red]&$reset_color/" 1>&2 )'


dot() {
		if [[ $LBUFFER = *.. ]]; then
					LBUFFER+=/..
		else
					LBUFFER+=.
		fi
}

autoload -U dot
zle -N dot
bindkey . dot


# HISTORY
# number of lines kept in history
export HISTSIZE=10000
# number of lines saved in the history after logout
export SAVEHIST=10000
# location of history
export HISTFILE=~/.zhistory
# append command to history file once executed
setopt inc_append_history
#ignore dublicate commands
setopt hist_ignore_all_dups
bindkey '^R' history-incremental-search-backward
bindkey '^F' history-incremental-search-forward
bindkey '\e[5~' history-search-backward
bindkey '\e[6~' history-search-forward
bindkey -M viins '^[.' insert-last-word
bindkey "^[p" copy-prev-shell-word

# не пищать при дополнении или ошибках

setopt NO_BEEP


# если набрали путь к директории без комманды CD, то перейти

setopt AUTO_CD


# исправлять неверно набранные комманды

#setopt CORRECT_ALL
alias pdflink='gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=./result.pdf'
alias keepemerge='sudo FEATURES="keeptemp keepwork" emerge'
alias mc='TERM=xterm-256color mc'
alias et='emacsclient -t'
export XLIB_SKIP_ARGB_VISUALS=1
export SBCL_HOME='/usr/lib64/sbcl/'
source ~/.profile
#export TERM=xterm-256color
#
#автодополнение portage
autoload -U compinit promptinit
compinit
promptinit; prompt gentoo
zstyle ':completion::complete:*' use-cache 1
export TERM=xterm-256color
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

