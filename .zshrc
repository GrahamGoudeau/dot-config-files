# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:/opt/local/bin:${GOPATH}/bin:$HOME/src/istio-1.0.4/bin:$HOME/src/prometheus:$HOME/scripts/bin:$HOME/.linkerd2/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH=/Users/grahamgoudeau/.oh-my-zsh
# GO stuff
export GOPATH="${HOME}/go"
# export GOROOT="$(brew --prefix golang)/libexec"
# RUST stuff
export RUSTROOT="${HOME}/.cargo/env"
export PATH=${HOME}/.cargo/bin:$PATH
# eksctl
fpath=($fpath ~/.zsh/completion)
# Add src bins to PATH
export SRCBIN="${HOME}/src/bin"
export PATH=${GOPATH}/bin:${GOROOT}/bin:${SRCBIN}:$PATH
# Solo-kit-stuff
export SOLO_KIT_DIR=/Users/grahamgoudeau/go/src/github.com/solo-io/solo-kit
export SOLO_PROJECTS_DIR=/Users/grahamgoudeau/go/src/github.com/solo-io/solo-projects
export GLOO_DIR=/Users/grahamgoudeau/go/src/github.com/solo-io/gloo
#scripts folder
export SCRIPTS="~/src/scripts/"
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"
# fzf stuff
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}
# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}
# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"
# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"
# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"
# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13
# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"
# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"
# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"
# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"
# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"
# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"
# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  fzf
  osx
  minikube
  ripgrep
  wd
  colored-man-pages
  zsh-completions
  zsh-autosuggestions
  #zsh-syntax-highlighting ### Installed through brew- should not be listed here
  kubectl
)
source $ZSH/oh-my-zsh.sh
# User configuration
# export MANPATH="/usr/local/man:$MANPATH"
# You may need to manually set your language environment
# export LANG=en_US.UTF-8
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
# Compilation flags
# export ARCHFLAGS="-arch x86_64"
# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"
# Load Custom Functions
#if [[ -f "$HOME/.zsh/functions/fzf.inc" ]]; then
#	source "$HOME/.zsh/functions/fzf.inc"
#else
#	echo >&2 "WARNING: can't load shell functions"
#fi
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
# Example aliases
alias zshconfig="vim ~/.zshrc"
alias zshsource="source ~/.zshrc"
alias gmornin="brew update"
alias de="dep ensure -v"
alias valet="$HOME/src/valet/_output/valet"
alias cdsolo="cd $GOPATH/src/github.com/solo-io"
# alias ohmyzsh="mate ~/.oh-my-zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/grahamgoudeau/src/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/grahamgoudeau/src/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/grahamgoudeau/src/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/grahamgoudeau/src/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="/usr/local/opt/protobuf@3.6/bin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="$PATH:/Users/grahamgoudeau/istio-1.4.3/bin"


export SPACESHIP_GOLANG_SHOW=false
export SPACESHIP_DOCKER_SHOW=false

# This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}

changelog() {
	echo $1 | tr '\n' ' ' | sed -E 's| +| |g'
}

killport() {
        lsof -i TCP:$1 | grep LISTEN | awk '{print $2}' | xargs kill -9
}

license() {
        echo $(cd ~/code/licensing/pkg/cmd/genlicense/ && go run main.go | grep -A1 Encrypted | tail -n1)
        #echo eyJleHAiOjI1MTAwNzkxODIsImlhdCI6MTU2NDQ5NjIxNCwiayI6IjRLY1hndyJ9.8H37jqIYNPgg7F2tUYroIfB3v-pblnaxDQpdduUKGcc | base64
}

fmtchanged() {
	git diff --name-only | grep '.*.go$' | xargs goimports -w
}

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

zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

source /Users/grahamgoudeau/.gvm/scripts/gvm
export PATH=$HOME/.service-mesh-hub/bin:$PATH

# must be last
source /Users/grahamgoudeau/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export GITHUB_TOKEN=55f5b80983b8cf22ccf701b2ed01bcc07b87187d
export NPM_TOKEN=580f4a7a-8448-418c-86f0-4c9dd4da56d6


[[ -s "/Users/grahamgoudeau/.gvm/scripts/gvm" ]] && source "/Users/grahamgoudeau/.gvm/scripts/gvm"
