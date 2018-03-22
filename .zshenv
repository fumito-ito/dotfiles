# ------------------------------
# Android
# ------------------------------
ANDROID_HOME=$HOME/Library/Android/sdk

# -------------------------------
# Homebrew
# -------------------------------

# HomebrewでインストールしたCLIを優先的に利用する
PATH=/usr/local/bin:/usr/local/sbin:$PATH

# -----------------------------
# Programing languages
# ----------------------------

if [ -x "`which go`" ]; then
  GOROOT=`go env GOROOT`
  GOPATH=$HOME/Projects/go
  PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi

if [ -x "`which rbenv`" ]; then
  RBENV_ROOT=/usr/local/var/rbenv
  eval "$(rbenv init -)"
fi

if [ -x "`which nodebrew`" ]; then
  PATH=$HOME/.nodebrew/current/bin:$PATH
  NODEBREW_ROOT=/usr/local/var/nodebrew
fi

# -----------------------------
# Other tools
# ----------------------------

# Flutter
PATH=$HOME/Projects/com/github/flutter/flutter/bin:$PATH

# cargo
PATH=$PATH:$HOME/.cargo/bin

# 重複したpathを取り除く
typeset -U PATH
