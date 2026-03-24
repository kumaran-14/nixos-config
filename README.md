## NixOS Configuration

This Configuration was primarily created for a MacOS system

1. On fresh MacOS install developer tools
2. Install nix through nix-installer. This was a fork off of determinate-nix installer, which now only installs a closed source determinate nix. This new project will now install upstream nix.
4. Note: This creates partitions in your mac.
3. This comes with an uninstaller that you can easily use to uninstall.
5. For the first ever, you should run
`nix run nix-darwin -- switch --flake .  `

## Updating Configuration

1. For existing files, change them, and run:
`sudo darwin-rebuild switch --flake .#zeus --option eval-cache false --show-trace`
2. For new files, first add them to git, to allow nix to version track them
3. (Only for VSCode vim): sometimes you have you manually delete /Library/Application Support/User/settings.json and run darwin-rebuild and restart vscode to see vimconfig changes

If the output of rebuild command exits after showing files would be clobbered, then it means that rebuild did not successfully finish. Fix the clobber backup error my renameing the file manually and rerun build command.
TODO: Fix the backup issue: backupCommand is another option
Note: this is fixed now with overwriteBackup set to true

## Tmux
Tmux alone is special, installed outside of homemanager, but conf managed through nix. This is because I could not get tmux-fingers work with tmux. In general, plugings are a mess.



## Shorcuts

Read SHORTCUTS.md


# Keybindings
1. For built int keyboard for macos, read keyboard.nix
2. For external hyper allow x keyboard, i set it up manually, it is a one time thing anyways.
TODO:(copy from macos settings)
Hyper alloy keyboard key ====> Mapped Key
caps lock
windows = (option) = 


## Mac Apps
1. Manually install the mac apps in homebrew.nix
