;;
;; ADD ELISP DIRECTORY TO EMACS LOAD-PATH
;;----------------------------------------
(add-to-list 'load-path "~/elisp")
;;

;;
;; Load elisp files
;;------------------
(require 'web-mode)
(require 'install)
(require 'haml-mode)
(require 'yaml-mode)
(require 'scss-mode)

;;
;; SET WINDOW PROPERTIES
;;-----------------------
;; Display the full path to the current file.
(setq frame-title-format '("%b    (%f)"))
(setq icon-title-format '("Emacs: %b"))
;;
;; Display the time
(display-time)
;;

;;
;; START EMACS WITHOUT INTRO SCREEN
;;----------------------------------
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)
;;

;;
;; ENABLE IDO-MODE BY DEFAULT
;;----------------------------
(ido-mode t)
;;

;;
;; ACTIVATE ORG MODE
;;-------------------
;; The following lines are always needed.  Choose your own keys.
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;;
;; CC MODE SETTINGS
;;------------------
;; Set default editor style to "linux".
;; Set indent to 4 spaces.
(setq c-default-style "linux"
c-basic-offset 4)

;;
;; SCHEME SETTINGS
;;-----------------
;;; Always do syntax highlighting
(global-font-lock-mode 1)

;;; Also highlight parens
(setq show-paren-delay 0
      show-paren-style 'parenthesis)
(show-paren-mode 1)

;;; This is the binary name of my scheme implementation
(setq scheme-program-name "scm")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(dired-directory ((t (:inherit font-lock-function-name-face :background "green" :foreground "blue")))))
