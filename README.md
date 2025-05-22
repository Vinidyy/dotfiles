# My Personal dotfiles

I use gnu-stow as a symlink tool to manage my dotfiles, simply clone the repo and type stow <module_name> to put the symliinks in the right place.

Exmaple usage: stow nvim
For the hyrpconfig use with care, there are some specific settings for moniors, or in the UserConfigs there are some nvidia specific environmental variables.

For the monitors.conf use one that fits and create a symlink that points to the monitors.conf:
Example: ln -sf ~/.config/hypr/monitors_desktop.conf ~/.config/hypr/monitors.conf
