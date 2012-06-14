(add-to-list 'exec-path "/Users/ian/Library/Haskell/bin")
(dolist (mode '(tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

(add-to-list 'load-path "/Users/ian/.emacs.d/el-get/el-get")
(unless (require 'el-get nil t)
  (url-retrieve "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (let (el-get-master-branch)
       (end-of-buffer)
       (eval-print-last-sexp)
       ))))

(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))

(setq el-get-sources 
      '((:name haskell-mode :type git :url "https://github.com/haskell/haskell-mode.git")
	(:name idle-highlight-mode :type git :url "https://github.com/nonsequitur/idle-highlight-mode.git")))

(setq my-packages '(haskell-mode 
					color-theme-solarized 
					color-theme-almost-monokai 
					coffee-mode 
					magit 
					popup
					yasnippet
					org-mode
					idle-highlight-mode
					sr-speedbar
					ghc-mod))
(el-get 'sync my-packages)
(autoload 'ghc-init "ghc" nil t)

(setq visible-bell t
      inhibit-startup-message t
      color-theme-is-global t
      scroll-preserve-screen-position t)
(setq browse-url-browser-function 'browse-default-macosx-browser)
(show-paren-mode 1)
(subword-mode t)
(column-number-mode t)
(setq tab-width 4)
;; enable ido-mode, make it friendly
(ido-mode t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-auto-merge-work-directories-length nil
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-use-virtual-buffers t
      ido-handle-duplicate-virtual-buffers 2
      ido-max-prospects 10)
(defalias 'yes-or-no-p 'y-or-n-p)

(speedbar-add-supported-extension ".hs")
(defun enable-highlight-mode ()
  (idle-highlight-mode t))

(add-hook 'prog-mode-hook 'enable-highlight-mode)
(add-hook 'haskell-mode-hook 
	  '(lambda ()
	     (turn-on-haskell-indentation)
	     (turn-on-haskell-decl-scan)
	     (imenu-add-menubar-index)
	     (ghc-init)))
(setq haskell-indentation-cycle-warn nil)				

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(background-color "#042028")
 '(background-mode dark)
 '(cursor-color "#708183")
 '(custom-enabled-themes (quote (tango-dark)))
 '(custom-safe-themes (quote ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" default)))
 '(foreground-color "#708183")
 '(haskell-indentation-cycle-warn nil)
; '(haskell-mode-hook (quote (turn-on-haskell-indentation turn-on-haskell-decl-scan imenu-add-menubar-index)))
 '(safe-local-variable-values (quote ((eval ignore-errors "Write-contents-functions is a buffer-local alternative to before-save-hook" (add-hook (quote write-contents-functions) (lambda nil (delete-trailing-whitespace) nil)) (require (quote whitespace)) "Sometimes the mode needs to be toggled off and on." (whitespace-mode 0) (whitespace-mode 1)) (whitespace-line-column . 80) (whitespace-style face trailing lines-tail) (require-final-newline . t)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)
