alias et "emacsclient -t"
alias gh 'git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'
if not functions -q fisher; eval (curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher); end
if not functions -q anyfff_widget; fisher hagiyat/anyfff; end
if not type -q peco; eval (go get -u github.com/peco/peco/...); end
set -x ANYFFF__FINDER_APP peco
set -x ANYFFF__FILESEARCH_MAXDEPTH 3
if not functions -q fish_title; fisher vibrant; end
set GOPATH /home/feofan/go
set TERM xterm-24bit
function my_put_history
    history | peco --prompt "history >"  | read -l selected
    if [ $selected ]
      commandline -i $selected
      commandline -f repaint
    end
end
