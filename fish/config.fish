if status is-interactive
# Commands to run in interactive sessions can go here
end

### EXPORT ###
set fish_greeting                                 # Supresses fish's intro message
set TERM "xterm-256color"                         # Sets the terminal type

### FUNCTIONS ###

function ll 
ls -l $argv
end

function cleardesktop
mv ~/Desktop/* ~/D
end

alias mux="TERM=screen-256color-bce tmux"

# Setting PATH for Python 3.10
# The original version is saved in /Users/billli/.config/fish/config.fish.pysave
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.10/bin" "$PATH"
