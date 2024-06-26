# Set some human-friendly key aliases
typeset -gA keyinfo
keyinfo=(
	'Escape' '\e'
	'Control' '^'
	'Backspace' "^?"
	'Delete' "$terminfo[kdch1]"
	'Up' "$terminfo[kcuu1]"
	'Down' "$terminfo[kcud1]"
	'Left' "$terminfo[kcub1]"
	'Right' "$terminfo[kcuf1]"
	'ShiftTab' "$terminfo[kcbt]"
	)

# менюшку нам для астокомплита
#zstyle ':completion:*' menu yes select
#source /etc/zsh_command_not_found
bindkey '\e[3~' delete-char # del

autoload -Uz compinit && compinit

# autoload -U compinit # promptinit
# compinit
# promptinit;

# alias ls='ls --color=auto'
alias grep='grep --colour=auto'

alias gh='git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'

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


# HISTORY
# number of lines kept in history
export HISTSIZE=100000
# number of lines saved in the history after logout
export SAVEHIST=100000
# location of history
export HISTFILE=~/.zhistory
# append command to history file once executed
setopt inc_append_history
#ignore dublicate commands
setopt hist_ignore_all_dups
bindkey '^R' history-incremental-search-backward
bindkey '\e[5~' history-search-backward
bindkey '\e[6~' history-search-forward
bindkey -M viins '^[.' insert-last-word
bindkey "^[p" copy-prev-shell-word
# bindkey "$keyinfo[Control]Q" push-line # Save the current command in the buffer stack

# не пищать при дополнении или ошибках

setopt NO_BEEP


# если набрали путь к директории без комманды CD, то перейти

setopt AUTO_CD

alias et='emacsclient -t -a ""'
EM='emacsclient -c -a ""'
es(){
    emacs -nw /sudo:root@localhost:$1
}
alias em='emacs --dump-file="~/.emacs.d/emacs.pdmp"'
alias emm='emacs -Q -l ~/.emacs.d/mini.el'
source ~/.profile
#
#автодополнение portage
# autoload -U compinit promptinit
# compinit
# promptinit; prompt gentoo
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=** r:|=**'
zstyle ':completion:*' menu 'select=1'
export EDITOR="emacsclient -c -a ''"
export BROWSER=firefox
# source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export LC_ALL=en_US.UTF-8

#disable CTRL-S
stty -ixon

autoload -U colors && colors # Enable colors in prompt

function peco-put-history()
{
    BUFFER=$(history -n -r 1 | peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-put-history
bindkey '^r' peco-put-history

function peco-put-file()
{
    BUFFER=$(find . -type 'f' | peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-put-file
bindkey '^x^f' peco-put-file

function peco-put-dir()
{
    BUFFER=$(find . -type 'd' | peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-put-dir
bindkey '^x^i' peco-put-dir

function peco-cd()
{
    local dir
    dir=$(find . -type 'd' | peco)
    cd "$dir"
    zle clear-screen
}
zle -N peco-cd
bindkey '^x^o' peco-cd

# export XKB_DEFAULT_LAYOUT=us,ru
# export XKB_DEFAULT_VARIANT=,winkeys
# export XKB_DEFAULT_OPTIONS=grp:win_space_toggle,ctrl:nocaps,grp_led:caps
# export WLC_REPEAT_DELAY=200
# export WLC_REPEAT_RATE=60

function powerline_precmd() {
    PS1="$(~/go/bin/powerline-go -error $? -shell zsh -mode flat)"
}

function install_powerline_precmd() {
    for s in "${precmd_functions[@]}"; do
        if [ "$s" = "powerline_precmd" ]; then
            return
        fi
    done
    precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi

autoload -U +X bashcompinit && bashcompinit
type helm > /dev/null && source <(helm completion zsh)
type kubectl >/dev/null && source <(kubectl completion zsh)
true

complete -o nospace -C $HOME/go/bin/gocomplete go

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/feofan/projects/gcloud/google-cloud-sdk/path.zsh.inc' ]; then . '/home/feofan/projects/gcloud/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/feofan/projects/gcloud/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/feofan/projects/gcloud/google-cloud-sdk/completion.zsh.inc'; fi

[[ ! -r /home/feofan/.opam/opam-init/init.zsh ]] || source /home/feofan/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

vterm_printf(){
    if [ -n "$TMUX" ]; then
        # Tell tmux to pass the escape sequences through
        # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
        printf "\ePtmux;\e\e]%s\007\e\\" "$1"
    elif [ "${TERM%%-*}" = "screen" ]; then
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$1"
    else
        printf "\e]%s\e\\" "$1"
    fi
}

vterm_prompt_end() {
    vterm_printf "51;A$(whoami)@$(hostname):$(pwd)";
}
setopt PROMPT_SUBST
PROMPT=$PROMPT'%{$(vterm_prompt_end)%}'
export PATH="/usr/local/opt/libpq/bin:$PATH"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="/Users/sergeykostyaev/go/bin:$PATH"
eval "$(direnv hook zsh)"
