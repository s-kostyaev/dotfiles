set __GIT_PROMPT_DIR ~/bash-git-prompt
alias et "emacsclient -t"
alias gh 'git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'
if not functions -q fundle; eval (curl -sfL https://git.io/fundle-install); end
fundle plugin hagiyat/anyfff

if type -q peco
  set -x ANYFFF__FINDER_APP peco
  set -x ANYFFF__FILESEARCH_MAXDEPTH 3
end
