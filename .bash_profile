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