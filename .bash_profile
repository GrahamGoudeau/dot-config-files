# turn off bash bell sounds
setterm -blength 0
. ~/.bashrc

##
# Your previous /Users/graham/.bash_profile file was backed up as /Users/graham/.bash_profile.macports-saved_2015-05-30_at_00:45:14
##

# MacPorts Installer addition on 2015-05-30_at_00:45:14: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# OPAM configuration
. /home/graham/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# set up git auto complete
#if [ -f `brew --prefix`/etc/bash_completion ]; then
#        . `brew --prefix`/etc/bash_completion
#fi

# curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
