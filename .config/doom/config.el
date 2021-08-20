;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


(setq user-full-name "Jakub Wołynko"
      user-mail-address "jwolynko@gmail.com"

      doom-scratch-initial-major-mode 'lisp-interaction-mode
      doom-theme 'doom-Iosvkem

      doom-font (font-spec :family "Fira Code Medium" :size 14)

      display-line-numbers-type nil

      company-idle-delay nil

      lsp-ui-sideline-enable nil
      lsp-enable-symbol-highlighting nil

      evil-ex-substitute-global t)

;; set transparent background
(set-frame-parameter (selected-frame) 'alpha '(92 . 90))
(add-to-list 'default-frame-alist '(alpha . (92 . 90)))

;; try with auto company mode
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0
      company-minimum-prefix-length 2
      company-selection-wrap-around t)
(company-tng-configure-default)

;; === babel settings
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (http . t)
   (gnuplot . t)
   (ledger . t)
   (plantuml . t)))

;;;; === python
(setq python-shell-interpreter "/usr/lib/python3.8")

;; === plugins
;;planulm-org
;;(add-to-list 'org-src-lang-modes '("plantuml" . plantuml))
(setq plantuml-jar-path "/home/kuba/bin/plantuml.jar")
(setq plantuml-default-exec-mode 'jar)

;; org-roam
(setq org-directory "~/org/"
      org-roam-directory (concat org-directory "roam/"))

;;gnuplot
(setq gnuplot-program "gnuplot")

;; elixir
(require 'eglot)
(add-hook 'elixir-mode-hook 'eglot-ensure)
(add-to-list 'eglot-server-programs '(elixir-mode "/home/kuba/.elixir-ls/language_server.sh"))

;; === languages support
;; require:
;; npm install -g vls
;; npm install eslint
;; npm install vscode-css-languageservice
;;(require 'eglot)
;;(require 'web-mode)
;;(define-derived-mode genehack-vue-mode web-mode "ghVue"
;;  "A major mode derived from web-mode, for editing .vue files with LSP support.")
;;(add-to-list 'auto-mode-alist '("\\.vue\\'" . genehack-vue-mode))
;;(add-hook 'genehack-vue-mode-hook #'eglot-ensure)
;;(add-to-list 'eglot-server-programs '(genehack-vue-mode "vls"))

;; === custom templates
;; haskell template
(add-to-list 'org-structure-template-alist '("hs" . "src haskell :results value pp"))

;; 3sky.dev template
(add-to-list 'org-structure-template-alist
             '("blog" . "#+title: Hello World\n#+description: Writing stuff in Orgmode\n#+date: 2021-02-15T12:10:02Z\n#+author: 3sky\n\n#+hugo_base_dir: /home/kuba/repos/blog/blog.3sky.dev\n#+hugo_section: blog\n#+hugo_draft: false\n#+hugo_custom_front_matter: :topics Tools\n\n* Welcome\n* Summary"))

;; === key binding
(map! :leader
      :desc "Insert template"
      "i t" #'org-insert-structure-template)

(map! :leader
      :desc "Hide code block"
      "t t" #'hs-toggle-hiding)
