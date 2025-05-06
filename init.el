;; Enable Emacs' built-in package manager and set sources (MELPA = community packages)
(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu"   . "https://elpa.gnu.org/packages/")))
(package-initialize)

;; Download list of available packages if it's missing (usually on first run)
(unless package-archive-contents
  (package-refresh-contents))

;; Install use-package if needed (makes package setup cleaner and easier to manage)
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;; Load use-package and set it to always auto-install missing packages
(require 'use-package)
(setq use-package-always-ensure t)

;; Install and configure Magit (a Git interface for Emacs)
;; C-x g opens Magit's status window
(use-package magit
  :bind ("C-x g" . magit-status))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
