NixOS Configuration

This Configuration was primarily created for a MacOS system

1. On fresh MacOS install developer tools
2. Install nix through nix-installer. This was a fork off of determinate-nix installer, which now only installs a closed source determinate nix. This new project will now install upstream nix.
4. Note: This creates partitions in your mac.
3. This comes with an uninstaller that you can easily use to uninstall.

Updating Configuration
1. For existing files, change them, and run:
`sudo darwin-rebuild switch --flake .#zeus`
2. For new files, first add them to git, to allow nix to version track them
3. (Only for VSCode vim): sometimes you have you manually delete /Library/Application Support/User/settings.json and run darwin-rebuild and restart vscode to see vimconfig changes