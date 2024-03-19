;;; ~/.config/doom/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Kuba Wolynko"
      user-mail-address "kuba@3sky.dev")

(setq doom-scratch-initial-major-mode 'lisp-interaction-mode)

;;; UI

(setq doom-theme 'doom-flatwhite
      doom-font(font-spec :font-family "Iosevka Nerd Font" :size 16 ))

;; Relative linue numbers
(setq display-line-numbers-type 'relative)

;; Prevents some cases of Emacs flickering.
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))


;; set transparent background
(set-frame-parameter (selected-frame) 'alpha '(92 . 90))
(add-to-list 'default-frame-alist '(alpha . (92 . 90)))

;; open in full screen
(setq initial-frame-alist '((top . 1) (left . 1) (width . 114) (height . 32)))


;; play with tabs for yaml mode
(after! yaml-mode
  (setq-hook! 'yaml-mode-hook
    tab-width 2           ; ts=2
    indent-tabs-mode nil  ; sw=2
    evil-shift-width 2    ; sw=2 (for evil mode)
    yaml-indent-offset 2  ; ai (YAML indent)
    yaml-encoding 'utf-8
    yaml-indent-offset 2  ; ai
    )
  )

;;;; === python
(setq python-shell-interpreter "/usr/bin/python3")

;; org-roam
(setq org-directory "~/Org-mode/"
      org-roam-directory (concat org-directory "roam/")
      org-agenda-files (directory-files-recursively org-roam-directory "\\.org$"))

;; === key binding
(map! :leader
      :desc "Insert template"
      "i t" #'org-insert-structure-template)

(map! :leader
      :desc "Hide code block"
      "t t" #'hs-toggle-hiding)

;; reload agedna
(defun my/redo-all-agenda-buffers ()
  (interactive)
  (dolist (buffer (buffer-list))
    (when (derived-mode-p 'org-agenda-mode)
      (org-agenda-maybe-redo))))

(add-hook 'org-mode-hook
          (lambda ()
            (add-hook 'after-save-hook 'my/redo-all-agenda-buffers nil 'make-it-local)))
