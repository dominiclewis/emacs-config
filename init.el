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

;; ------------------------
;; Org Mode configuration
;; ------------------------

;; Ensure Org directories exist
(dolist (dir '("~/org"
               "~/org/projects"))
  (unless (file-directory-p dir)
    (make-directory dir t)))  ;; Create parent dirs if needed

;; Create base Org files if they don't exist (leave empty to evolve style)
(dolist (file '("~/org/inbox.org"
                "~/org/notes.org"))
  (unless (file-exists-p file)
    (with-temp-buffer (write-file file))))

;; Org Mode via use-package
(use-package org
  :pin gnu                                ;; Use GNU version (stable)
  :mode ("\\.org\\'" . org-mode)          ;; Use org-mode for .org files
  :hook (org-mode . visual-line-mode)     ;; Wrap lines visually
  :config
  ;; Set base directory for Org files
  (setq org-directory "~/org")

  ;; Default notes target
  (setq org-default-notes-file
        (expand-file-name "inbox.org" org-directory))

  ;; Agenda files: inbox, notes, and all .org files in projects/
  (setq org-agenda-files
        (append
         (list (expand-file-name "inbox.org" org-directory)
               (expand-file-name "notes.org" org-directory))
         (directory-files-recursively
          (expand-file-name "projects" org-directory)
          "\\.org$")))

  ;; UI and behavior tweaks
  (setq org-hide-emphasis-markers t       ;; Hide *bold* /italic/ markers
        org-startup-indented t            ;; Nicely indent content
        org-ellipsis " ▾"                ;; Pretty fold symbol
        org-log-done 'time))             ;; Timestamp when marking TODO done


;; Emacs auto-gen
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
