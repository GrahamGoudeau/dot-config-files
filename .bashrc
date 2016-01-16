alias l='ls -laF'
alias j='jobs'
alias rmsafe='rm -i'
alias g='git status'
alias gap='git add -ip'
alias gch='git checkout'
alias gbr='git branch'

cdl () { cd "$@" && l; }
mkcd () { mkdir "$@" && cd "$@"; }

alias editbash='vim ~/.bashrc'
alias editvim='vim ~/.vimrc'


PS1='\w > '

alias tufts='ssh ggoude01@homework.cs.tufts.edu'
alias tuftsX='ssh -X ggoude01@homework.cs.tufts.edu'

# does not work; illegal -S operation with du
# alias diskspace="du -S | sort -n -r |more"

# goes up directory the given number of times, one by default
up(){
  local d=""
  limit=$1
  for ((i=1 ; i <= limit ; i++))
    do
      d=$d/..
    done
  d=$(echo $d | sed 's/^\///')
  if [ -z "$d" ]; then
    d=..
  fi
  cd $d
}

alias upl='up; l'

if [ 1 -eq 0 ]; then
RESET="\[\017\]"
NORMAL="\[\033[0m\]"
RED="\[\033[31;1m\]"
YELLOW="\[\033[33;1m\]"
WHITE="\[\033[37;1m\]"
SMILEY="${WHITE}:)${NORMAL}"
FROWNY="${RED}:(${NORMAL}"
SELECT="if [ \$? = 0 ]; then echo \"${SMILEY}\"; else echo \"${FROWNY}\"; fi"

# Throw it all together
PS1="${RESET}${YELLOW}\h${NORMAL} \`${SELECT}\` ${YELLOW}>${NORMAL} "
fi

GOPATH=$HOME/go
PATH=$PATH:/Users/graham/bin
PATH=$PATH:$GOPATH/bin
export PATH=~/mongodb/mongodb-linux-x86_64-3.0.7/bin:$PATH

export VISUAL=vim
export EDITOR="$VISUAL"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
