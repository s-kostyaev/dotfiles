GOPATH=$HOME/go
PATH=$PATH:$GOPATH/bin:$HOME/.local/bin:$HOME/.cabal/bin:$HOME/.ghcup/bin:/usr/local/texlive/2024/bin/universal-darwin/
export TERM=xterm-256color
export EDITOR="emacs -Q -l ~/.emacs.d/mini.el -nw"
export QT_QPA_PLATFORMTHEME=gtk2
export DTK_PROGRAM=espeak
export LSP_USE_PLISTS=true

# Added by microsandbox installer
export PATH="$HOME/.local/bin:$PATH"
export DYLD_LIBRARY_PATH="$HOME/.local/lib:$DYLD_LIBRARY_PATH"
