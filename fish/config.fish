# Path to Oh My Fish install.
set -gx OMF_PATH "/home/rll/.local/share/omf"

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG "/home/rll/.config/omf"

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

# Ensure Steam use system libraries
export STEAM_RUNTIME=0

# Use vim as the default editor
export EDITOR="vim"

# Add dotfiles bin directory to PATH
set -U PATH ~/dotfiles/bin $PATH

# Python Developpement
export PYTHONPATH="{$PYTHONPATH}:/home/rll/dev/omtk:/home/rll/dev/python"

# Arch-Linux specific
alias install="pacaur -Sy"
alias uninstall="sudo pacman -R"
alias update="sudo pacman -Syu"

