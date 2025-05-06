# emacs-config

## How to use

`git clone git@github.com:dominiclewis/emacs-config.git ~/.config/emacs`


### ⚠️ Emacs config not loading?

If Emacs isn't loading this config, it's likely because an existing `~/.emacs.d/` directory is taking priority.  
Emacs will load `~/.emacs.d/init.el` before it checks `~/.config/emacs/init.el`.

To fix this:

1. Delete the old `.emacs.d` if it's no longer needed:
   ```sh
   rm -rf ~/.emacs.d
   ```
