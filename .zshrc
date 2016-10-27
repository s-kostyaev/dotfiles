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
bindkey ';5D' backward-word # ctrl+left 
bindkey ';5C' forward-word #ctrl+right

autoload -U compinit # promptinit
compinit
# promptinit;

# git status
# source /home/feofan/zsh/zsh-git-prompt/zshrc.sh
PROMPT=$'%{\e[1;32m%}%{$fg[cyan]%}%n%{$fg[blue]%}@%{$fg[green]%}%m %{\e[1;34m%}%~ %{\e[0m%} %# '

# if [[ $EUID == 0 ]] 
# then
# PROMPT=$'%{\e[1;31m%}%n %{\e[1;34m%}%~ #%{\e[0m%} ' # user dir %
# else
# PROMPT=$'%{\e[1;32m%}%n %{\e[1;34m%}%~ %#%{\e[0m%} ' # root dir #
# fi
# RPROMPT=$'$(git_super_status) %{\e[1;34m%}%T%{\e[0m%}' # right prompt with time

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
# bindkey "$keyinfo[Control]Q" push-line # Save the current command in the buffer stack

# не пищать при дополнении или ошибках

setopt NO_BEEP


# если набрали путь к директории без комманды CD, то перейти

setopt AUTO_CD


# исправлять неверно набранные комманды

#setopt CORRECT_ALL
alias pdflink='gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=./result.pdf'
alias keepemerge='sudo FEATURES="keeptemp keepwork" emerge'
alias mc='TERM=xterm-256color mc'
alias et='emacsclient -t -a ""'
alias eg='emacsclient -c -a ""'
EM='emacsclient -c -a ""'
es(){
    emacsclient -a "" -t /sudo:root@localhost:$1
}
ci(){
    curl http://container.s:8081/v2/c/node0.in.ngs.ru.$1/stats | jq '.'
}
ra(){
    curl http://snob.s/hsd:rn:ngs:engineers/$1
}
dbi(){
    curl http://db8.farm.s:8081/v2/c/$1/stats | jq '.'
}
alias jo='mcabber -f .mcabberrc.office'
alias jh='mcabber -f .mcabberrc.home'
alias sln='mcabber -f .mcabberrc.slack-ngs'
alias slp='mcabber -f .mcabberrc.slack-postdevops'
alias slg='mcabber -f .mcabberrc.slack-go'
alias gt='gtypist --banner-colors=6,7,6,7 -c 0,7 --scoring=cpm'
alias mo='mutt -F ~/.muttrc.office'
alias my='mutt -F ~/.muttrc.yandex'
alias mya='mutt -F ~/.muttrc.yahoo'
export XLIB_SKIP_ARGB_VISUALS=1
export SBCL_HOME='/usr/lib64/sbcl/'
source ~/.profile
export TERM=xterm-256color
#
#автодополнение portage
# autoload -U compinit promptinit
# compinit
# promptinit; prompt gentoo
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=** r:|=**'
export EDITOR=emacsclient
export BROWSER=chromium
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export LC_ALL=en_US.UTF-8

#disable CTRL-S
stty -ixon

# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then

    # specify plugins here
    zgen load seletskiy/zsh-smart-kill-word

    # generate the init script from plugins above
    zgen save
fi

bindkey '^W' smart-backward-kill-word
bindkey '^S' smart-forward-kill-word

# Adapted from code found at <https://gist.github.com/1712320>.

setopt prompt_subst
autoload -U colors && colors # Enable colors in prompt

# Modify the colors and symbols in these variables as desired.
GIT_PROMPT_SYMBOL="%{$fg[blue]%}±"
GIT_PROMPT_PREFIX="%{$fg[green]%}[%{$reset_color%}"
GIT_PROMPT_SUFFIX="%{$fg[green]%}]%{$reset_color%}"
GIT_PROMPT_AHEAD="%{$fg[red]%}ANUM%{$reset_color%}"
GIT_PROMPT_BEHIND="%{$fg[cyan]%}BNUM%{$reset_color%}"
GIT_PROMPT_MERGING="%{$fg[magenta]%}⚡#︎%{$reset_color%}"
GIT_PROMPT_UNTRACKED="%{$fg[red]%}*%{$reset_color%}"
GIT_PROMPT_MODIFIED="%{$fg[yellow]%}*%{$reset_color%}"
GIT_PROMPT_STAGED="%{$fg[green]%}*%{$reset_color%}"

# Show Git branch/tag, or name-rev if on detached head
parse_git_branch() {
    (git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null
}

# Show different symbols as appropriate for various Git repository states
parse_git_state() {

    # Compose this value via multiple conditional appends.
    local GIT_STATE=""

    local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
    if [ "$NUM_AHEAD" -gt 0 ]; then
        GIT_STATE=$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}
    fi

    local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
    if [ "$NUM_BEHIND" -gt 0 ]; then
        GIT_STATE=$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}
    fi

    local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
    if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
        GIT_STATE=$GIT_STATE$GIT_PROMPT_MERGING
    fi

    if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
        GIT_STATE=$GIT_STATE$GIT_PROMPT_UNTRACKED
    fi

    if ! git diff --quiet 2> /dev/null; then
        GIT_STATE=$GIT_STATE$GIT_PROMPT_MODIFIED
    fi

    if ! git diff --cached --quiet 2> /dev/null; then
        GIT_STATE=$GIT_STATE$GIT_PROMPT_STAGED
    fi

    if [[ -n $GIT_STATE ]]; then
        echo "$GIT_PROMPT_PREFIX$GIT_STATE$GIT_PROMPT_SUFFIX"
    fi

}

# If inside a Git repository, print its branch and state
git_prompt_string() {
    local git_where="$(parse_git_branch)"
    [ -n "$git_where" ] && echo "$GIT_PROMPT_SYMBOL$(parse_git_state)$GIT_PROMPT_PREFIX%{$fg[yellow]%}${git_where#(refs/heads/|tags/)}$GIT_PROMPT_SUFFIX"
}

# Set the right-hand prompt
RPS1='$(git_prompt_string)'

export XKB_DEFAULT_LAYOUT=us,ru
export XKB_DEFAULT_VARIANT=,winkeys
export XKB_DEFAULT_OPTIONS=grp:alt_shift_toggle,ctrl:nocaps,grp_led:caps
