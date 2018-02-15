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

autoload -U compinit # promptinit
compinit
# promptinit;

alias ls='ls --color=auto'
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
bindkey '^F' history-incremental-search-forward
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
alias eg='emacsclient -c -a ""'
EM='emacsclient -c -a ""'
es(){
    emacsclient -a "" -t /sudo:root@localhost:$1
}
source ~/.profile
#
#автодополнение portage
# autoload -U compinit promptinit
# compinit
# promptinit; prompt gentoo
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=** r:|=**'
zstyle ':completion:*' menu 'select=1'
export EDITOR=emacsclient
export BROWSER=chromium
# source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export LC_ALL=en_US.UTF-8

#disable CTRL-S
stty -ixon

autoload -U colors && colors # Enable colors in prompt

# # Modify the colors and symbols in these variables as desired.
# GIT_PROMPT_SYMBOL="%{$fg[blue]%}±%{$reset_color%}"
# GIT_PROMPT_PREFIX="%{$fg[green]%}[%{$reset_color%}"
# GIT_PROMPT_SUFFIX="%{$fg[green]%}]%{$reset_color%}"
# GIT_PROMPT_AHEAD="%{$fg[red]%}ANUM%{$reset_color%}"
# GIT_PROMPT_BEHIND="%{$fg[cyan]%}BNUM%{$reset_color%}"
# GIT_PROMPT_MERGING="%{$fg[magenta]%}⚡#︎%{$reset_color%}"
# GIT_PROMPT_UNTRACKED="%{$fg[red]%}*%{$reset_color%}"
# GIT_PROMPT_MODIFIED="%{$fg[yellow]%}*%{$reset_color%}"
# GIT_PROMPT_STAGED="%{$fg[green]%}*%{$reset_color%}"

# # Show Git branch/tag, or name-rev if on detached head
# parse_git_branch() {
#     (git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null
# }

# # Show different symbols as appropriate for various Git repository states
# parse_git_state() {

#     # Compose this value via multiple conditional appends.
#     local GIT_STATE=""

#     local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
#     if [ "$NUM_AHEAD" -gt 0 ]; then
#         GIT_STATE=$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}
#     fi

#     local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
#     if [ "$NUM_BEHIND" -gt 0 ]; then
#         GIT_STATE=$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}
#     fi

#     local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
#     if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
#         GIT_STATE=$GIT_STATE$GIT_PROMPT_MERGING
#     fi

#     if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
#         GIT_STATE=$GIT_STATE$GIT_PROMPT_UNTRACKED
#     fi

#     if ! git diff --quiet 2> /dev/null; then
#         GIT_STATE=$GIT_STATE$GIT_PROMPT_MODIFIED
#     fi

#     if ! git diff --cached --quiet 2> /dev/null; then
#         GIT_STATE=$GIT_STATE$GIT_PROMPT_STAGED
#     fi

#     if [[ -n $GIT_STATE ]]; then
#         echo "$GIT_PROMPT_PREFIX$GIT_STATE$GIT_PROMPT_SUFFIX"
#     fi

# }

# export PATH=~/bin/:$PATH

# # If inside a Git repository, print its branch and state
# git_prompt_string() {
#     local git_where="$(parse_git_branch)"
#     [ -n "$git_where" ] && echo "$GIT_PROMPT_PREFIX%{$fg[yellow]%}${git_where#(refs/heads/|tags/)}$GIT_PROMPT_SUFFIX$(parse_git_state)$GIT_PROMPT_SYMBOL"
# }

# # Set the right-hand prompt
# # RPS1='$(git_prompt_string)'

# local returncode="%(?..%{$fg[red]%} %? ↵%{$reset_color%})"

# setopt promptsubst
# PROMPT=$'%{\e[1;32m%}%{$fg[cyan]%}%n%{$fg[blue]%}@%{$fg[green]%}%m %{\e[1;34m%}%~ %{\e[0m%}$(git_prompt_string)${returncode} %% '

function powerline_precmd() {
    PS1="$(~/go/bin/powerline-go -error $? -shell zsh)"
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

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /home/feofan/go/bin/gocomplete go
type helm > /dev/null && source <(helm completion zsh)
type kubectl >/dev/null && source <(kubectl completion zsh)
true
