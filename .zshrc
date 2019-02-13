export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
export CPATH=$HOME/cuda/include:$CPATH
export LIBRARY_PATH=$HOME/cuda/lib64:$LIBRARY_PATH
export LD_LIBRARY_PATH=$HOME/cuda/lib64:$LD_LIBRARY_PATH
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
PROMPT='%F{3}%n: %c $ %f'
autoload -U compinit
compinit

export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

alias ls="ls -GF"
alias gls="gls --color"

zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

case "${OSTYPE}" in
darwin*)
  # Mac
  alias ls="ls -GF"
  ;;
linux*)
  # Linux
  alias ls='ls -F --color'
  ;;
esac

# cdを使わずにディレクトリを移動できる
setopt auto_cd
# "cd -"の段階でTabを押すと、ディレクトリの履歴が見れる
setopt auto_pushd
# コマンドの打ち間違いを指摘してくれる
setopt correct
