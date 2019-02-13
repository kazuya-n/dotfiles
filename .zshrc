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

# cd$B$r;H$o$:$K%G%#%l%/%H%j$r0\F0$G$-$k(B
setopt auto_cd
# "cd -"$B$NCJ3,$G(BTab$B$r2!$9$H!"%G%#%l%/%H%j$NMzNr$,8+$l$k(B
setopt auto_pushd
# $B%3%^%s%I$NBG$A4V0c$$$r;XE&$7$F$/$l$k(B
setopt correct
