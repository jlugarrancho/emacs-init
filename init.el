;; Establece Command como M-
(setq mac-option-modifier nil
      mac-command-modifier 'meta
      x-select-enable-clipboard t)

;; org-mode configuration
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; melpa repository
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

;; custom themes
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "274fa62b00d732d093fc3f120aca1b31a6bb484492f31081c1814a858e25c72e" default)))
 '(package-selected-packages
   (quote
    (racket-mode auctex latex-preview-pane cyberpunk-theme zenburn-theme sunburn-theme solarized-theme spacemacs-theme dracula-theme ess markdown-mode)))
 '(preview-orientation (quote below)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; PATH OSX
(setq exec-path (cons "/usr/local/bin" exec-path))

;; ESS load
(require 'ess-site)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)))

;; PATH R 
(setq org-babel-R-command "/usr/local/bin/R --slave --no-save")

;; Mostrar numero filas
(global-display-line-numbers-mode)

;; Establece tema personalizado
(load-theme 'monokai)

;; Muestra siempre la posicion del cursor en la  columna
(column-number-mode 1)

;; Establece 80 como num de caracteres maximos en columna en text-mode
(setq-default fill-column 80)

;; Tamaño de pantalla al abrir 100 columnas 35 filas 
(when window-system (set-frame-size (selected-frame) 100 35))

;; Latex PATH en macOS 
(setenv "PATH" (concat (getenv "PATH") ":/Library/TeX/texbin/"))  
(setq exec-path (append exec-path '("/Library/TeX/texbin/")))

;; Path racket-mode REPL
(setq racket-program "/Applications/Racket v7.2/bin/racket")
