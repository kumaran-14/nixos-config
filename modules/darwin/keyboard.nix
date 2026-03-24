{
  ...
}:{
  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToControl = true;
  };
  system.defaults = {
    # trackpad settings
    trackpad = {
    # silent clicking = 0, default = 1
    ActuationStrength = 0;
    # enable tap to click
    Clicking = true;
    Dragging = true; # tap and a half to drag
    # three finger click and drag
    TrackpadThreeFingerDrag = true;
    };
    NSGlobalDomain = {
        "com.apple.swipescrolldirection" = true; # "natural" scrolling
        "com.apple.keyboard.fnState" = true;
        "com.apple.springing.enabled" = false;
        "com.apple.trackpad.scaling" = 4.0; # fast
        "com.apple.trackpad.enableSecondaryClick" = true;
        "com.apple.mouse.tapBehavior" = 1; # tap to click
        # enable full keyboard control
        # (e.g. enable Tab in modal dialogs)
        #AppleKeyboardUIMode = 3;
        # no popup menus when holding down letters
        ApplePressAndHoldEnabled = false;
        # delay before repeating keystrokes
        InitialKeyRepeat = 14;
        # delay between repeated keystrokes upon holding a key
        KeyRepeat = 1;
    };
  };
}