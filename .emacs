(add-to-list 'load-path "~/.emacs.d")
(progn (cd "~/.emacs.d")
       (normal-top-level-add-subdirs-to-load-path))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(browse-url-chromium-program "chromium")
 '(custom-enabled-themes (quote (sanityinc-solarized-dark)))
 '(custom-safe-themes
   (quote
	("96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "46fd293ff6e2f6b74a5edf1063c32f2a758ec24a5f63d13b07a20255c074d399" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" "1a85b8ade3d7cf76897b338ff3b20409cb5a5fbed4e45c6f38c98eee7b025ad4" "7bde52fdac7ac54d00f3d4c559f2f7aa899311655e7eb20ec5491f3b5c533fe8" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "f0b0710b7e1260ead8f7808b3ee13c3bb38d45564e369cbe15fc6d312f0cd7a0" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(display-time-mode t)
 '(frame-background-mode (quote dark))
 '(help-at-pt-display-when-idle (quote (flymake-overlay)) nil (help-at-pt))
 '(help-at-pt-timer-delay 0.9)
 '(indent-line-function (quote insert-tab) t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(jabber-auto-reconnect t)
 '(jabber-avatar-verbose nil)
 '(jabber-backlog-days 300)
 '(jabber-chat-buffer-format "*-jabber-%n-*")
 '(jabber-history-enabled t)
 '(jabber-mode-line-mode t)
 '(jabber-roster-buffer "*-jabber-*")
 '(jabber-roster-line-format " %c %-25n %u %-8s (%r)")
 '(jabber-show-offline-contacts nil)
 '(jabber-vcard-avatars-retrieve nil)
 '(package-archives
   (quote
	(("gnu" . "http://elpa.gnu.org/packages/")
	 ("melpa" . "http://melpa.org/packages/"))))
 '(starttls-extra-arguments (quote ("--insecure")))
 '(starttls-use-gnutls t)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(warning-suppress-types (quote ((undo discard-info)))))

;; Melpa
(require 'package) ;; You might already have this line
;; (add-to-list 'package-archives
;; 			              '("melpa" . "http://melpa.org/packages/") t)
;; (when (< emacs-major-version 24)
;;     ;; For important compatibility libraries like cl-lib
;;     (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

										; for automatic download required packages
(defun need-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
	   t
	 (if (or (assoc package package-archive-contents) no-refresh)
		 (package-install package)
	   (progn
		 (package-refresh-contents)
		 (require-package package min-version t)))))


(defun require-package (package &optional min-version no-refresh)
  "Load package (download if need)"
  (progn 
	(need-package package min-version no-refresh)
	(require 'package)))

(need-package 'color-theme)
;(require 'color-theme)
;(setq color-theme-is-global t)
;(color-theme-initialize)
;(color-theme-comidia)
(need-package 'zenburn-theme)
(load-theme 'zenburn t)

(need-package 'sublime-themes)

;; (global-linum-mode 1)
(need-package 'nlinum)
;(nlinum-mode 1)
;(add-hook 'find-file-hook (lambda () (nlinum-mode 1)))

										;; powerline
(require-package 'smart-mode-line)
;(need-package 'smart-mode-line-powerline-theme)
(sml/setup t)
;; (sml/apply-theme "powerline")
(sml/apply-theme 'respectful)

;; (require-package 'whitespace)
;; (global-whitespace-mode)

; Use VIM keybindings :)
;; (add-to-list 'load-path "~/.emacs.d/evil")
;; (require-package 'evil)  
;; (evil-mode 1)

;; to setup tabs
(setq c-basic-indent 4)
(setq tab-width 4)
(setq tab-stop-list (number-sequence 4 200 4))
(setq-default indent-tabs-mode nil)


(add-hook 'text-mode-hook
	        (lambda () (setq indent-line-function 'insert-tab)))

; (highlight-tabs)
; (highlight-trailing-whitespace)



;; Text and the such
;; Use colors to highlight commands, etc.
(global-font-lock-mode t) 
;; Disable the welcome message
(setq inhibit-startup-message t)
;; Format the title-bar to always include the buffer name
(setq frame-title-format "emacs - %b")
;; Display time
(display-time)
;; Make the mouse wheel scroll Emacs
(mouse-wheel-mode t)
;; Always end a file with a newline
(setq require-final-newline t)
;; Stop emacs from arbitrarily adding lines to the end of a file when the
;; cursor is moved past the end of it:
(setq next-line-add-newlines nil)
;; Flash instead of that annoying bell
(setq visible-bell t)
;; Remove icons toolbar
;(if (> emacs-major-version 20)
;(tool-bar-mode -1))
;; Use y or n instead of yes or not
(fset 'yes-or-no-p 'y-or-n-p)


;;;; Go mode
(setenv "GOPATH" "/home/feofan/go")
(setq exec-path (append exec-path '("~/go/bin")))
(need-package 'go-mode)
(require 'go-mode-autoloads)
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c i") 'go-goto-imports)))
(require-package 'company-go)                                ; load company mode go backend
(setq company-tooltip-limit 20)                      ; bigger popup window
(setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
(setq company-echo-delay 0)                          ; remove annoying blinking
(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing
(add-hook 'go-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)))
;; Flymake
(require-package 'flymake)

(add-to-list 'load-path "~/go/src/github.com/dougm/goflymake")
(require 'go-flymake)
;; doc
(need-package 'go-eldoc) ;; Don't need to require, if you install by package.el
(add-hook 'go-mode-hook 'go-eldoc-setup)
(add-hook 'go-mode-hook '(lambda () (highlight-lines-matching-regexp ".\{81\}" "hi-green-b")))





; for compiling C/C++
(global-font-lock-mode t)
(global-set-key "\C-xs" 'save-buffer)
(global-set-key "\C-xv" 'quoted-insert)
(global-set-key "\C-xg" 'goto-line)
(global-set-key "\C-xf" 'search-forward)
(global-set-key "\C-xc" 'compile)
(global-set-key "\C-xt" 'text-mode);
(global-set-key "\C-xr" 'replace-string);
(global-set-key "\C-xa" 'repeat-complex-command);
(global-set-key "\C-xm" 'manual-entry);
(global-set-key "\C-xw" 'what-line);
(global-set-key "\C-x\C-u" 'shell);
(global-set-key "\C-x0" 'overwrite-mode);
(global-set-key "\C-x\C-r" 'toggle-read-only);
(global-set-key "\C-t" 'kill-word);
(global-set-key "\C-p" 'previous-line);
(global-set-key "\C-o" 'forward-word);
(global-set-key "\C-h" 'backward-delete-char-untabify);
(global-set-key "\C-x\C-m" 'not-modified);
(setq make-backup-files 'nil);
(setq default-major-mode 'text-mode)
(setq text-mode-hook 'turn-on-auto-fill)
(set-default-font "-misc-fixed-medium-r-normal-*-13-140-*-*-c-*-*-1")
(setq auto-mode-alist (cons '("\\.cxx$" . c++-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.hpp$" . c++-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.tex$" . latex-mode) auto-mode-alist))

;(require-package 'font-lock)
;(add-hook 'c-mode-hook 'turn-on-font-lock)
;(add-hook 'c++-mode-hook 'turn-on-font-lock)

; http://nex-3.com/posts/45-efficient-window-switching-in-emacs#comments
(global-set-key [M-left] 'windmove-left)          ; move to left windnow
(global-set-key [M-right] 'windmove-right)        ; move to right window
(global-set-key [M-up] 'windmove-up)              ; move to upper window
(global-set-key [M-down] 'windmove-down)          ; move to downer window



; Settings by Carlo Hamalainen:
;(global-set-key [f8] 'save-buffer)  ; F8 saves the current buffer (file)
; (global-set-key [f9] 'compile)  
;(global-set-key [f9] 'slime-compile-and-load-file)

;; http://emacs-fu.blogspot.com/2008/12/cycling-through-your-buffers-with-ctrl.html
;; cycle through buffers with Ctrl-Tab (like Firefox)
(global-set-key (kbd "<C-tab>") 'bury-buffer)



; http://emacsblog.org/2007/01/17/indent-whole-buffer/
(defun iwb ()
    "indent whole buffer"
    (interactive)
    (delete-trailing-whitespace)
    (indent-region (point-min) (point-max) nil)
    (untabify (point-min) (point-max)))

(put 'downcase-region 'disabled nil)


;;jabber
(require-package 'jabber)
(global-set-key "\C-x\C-a" 'jabber-activity-switch-to)
;input history
(defvar my-jabber-input-history '() "Variable that holds input history")
(make-variable-buffer-local 'my-jabber-input-history)

(defvar my-jabber-input-history-position 0 "Current position in input history")
(make-variable-buffer-local 'my-jabber-input-history-position)

(defvar my-jabber-input-history-current nil "Current input value")
(make-variable-buffer-local 'my-jabber-input-history-current)

(defun my-jabber-input-history-hook (body id)
  (add-to-list 'my-jabber-input-history body t)
  (setq my-jabber-input-history-position (length my-jabber-input-history)))
(add-hook 'jabber-chat-send-hooks 'my-jabber-input-history-hook)

(defun my-jabber-previous-input ()
  (interactive)
  (let (current-input (pos my-jabber-input-history-position) (len (length my-jabber-input-history)))
    (if (= pos 0)
        (message "%s" "No previous input")
      (setq current-input (delete-and-extract-region jabber-point-insert (point-max)))
      (when (= pos len) ; running first time, save current input
          (setq my-jabber-input-history-current current-input))
      (decf my-jabber-input-history-position)
      (insert (nth my-jabber-input-history-position my-jabber-input-history)))))

(defun my-jabber-next-input ()
  (interactive)
  (let ((pos my-jabber-input-history-position) (len (length my-jabber-input-history)))
    (cond
     ((= pos (1- len)) ; pointing at the last element, insert saved input
       (incf my-jabber-input-history-position)
       (delete-region jabber-point-insert (point-max))
       (insert my-jabber-input-history-current)
       (setq my-jabber-input-history-current nil))
      ((= pos len)                              ; pointing beyound last element, notify user
       (message "%s" "No next input"))
      (t                                ; insert next history item
       (incf my-jabber-input-history-position)
       (delete-region jabber-point-insert (point-max))
       (insert (nth my-jabber-input-history-position my-jabber-input-history))))))

;(define-key jabber-chat-mode-map (kbd "M-p") 'my-jabber-previous-input)
;(define-key jabber-chat-mode-map (kbd "M-n") 'my-jabber-next-input)

;;; Python mode
(need-package 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'eldoc-mode)
(need-package 'company-anaconda)

(setenv "PYMACS_PYTHON" "python2")
(autoload 'python-mode "python-mode.el" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
(add-hook 'python-mode-hook
          (lambda ()
              (add-to-list 'company-backends 'company-anaconda)
              (setq indent-tabs-mode nil)
              (setq python-indent 4)
              (setq tab-width 8)
              (local-set-key (kbd "<M-iso-lefttab>") 'py-shift-right)
              (local-set-key (kbd "<backtab>") 'py-shift-left)))

;;; Octave mode
;; (autoload 'octave-mode "octave-mod" nil t)
;;           ;(setq auto-mode-alist
;;           ;      (cons '("\\.m$" . octave-mode) auto-mode-alist))
;; (add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))
;; ;; to turn on the abbrevs, auto-fill and font-lock features automatically  
;;        (add-hook 'octave-mode-hook
;;          (lambda ()
;;          (abbrev-mode 1)
;;          (auto-fill-mode 1)
;;          (if (eq window-system 'x)
;;           (font-lock-mode 1))))

;; ;; And finally, inferior-octave-mode-hook is run after starting the process 
;;     ;; and putting its buffer into Inferior Octave mode. Hence, if you like 
;;     ;; the up and down arrow keys to behave in the interaction buffer as in 
;;     ;; the shell, and you want this buffer to use nice colors:
    
;;        (add-hook 'inferior-octave-mode-hook
;;          (lambda ()
;;            (turn-on-font-lock)
;;            (define-key inferior-octave-mode-map [up]
;;              'comint-previous-input)
;;            (define-key inferior-octave-mode-map [down]
;;              'comint-next-input)))
;; ;; run an inferior Octave process in a special Emacs buffer
;;        (autoload 'run-octave "octave-inf" nil t)



(setq fsm-debug nil)


;;; Auto-complete
(need-package 'company)
(require 'company)
(global-company-mode)

;;; ElDoc
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)


;;; Commenting
;; Original idea from
;; http://www.opensubscriber.com/message/emacs-devel@gnu.org/10971693.html
(defun comment-dwim-line (&optional arg)
        "Replacement for the comment-dwim command.
        If no region is selected and current line is not blank and we are not at the end of the line,
        then comment current line.
        Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
          (interactive "*P")
          (comment-normalize-vars)
          (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
              (comment-or-uncomment-region (line-beginning-position) (line-end-position))
            (comment-dwim arg)))
(global-set-key "\M-;" 'comment-dwim-line)


;; Clojure

(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(setq nrepl-hide-special-buffers t)
(setq cider-repl-print-length 100) ; the default is nil, no limit
;; (set cider-repl-result-prefix ";; => ")
;; (set cider-interactive-eval-result-prefix ";; => ")
(setq cider-repl-wrap-history t)
(setq cider-repl-history-size 1000) ; the default is 500
(add-hook 'cider-repl-mode-hook 'paredit-mode)


(require-package 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)


(setq browse-url-browser-function 'browse-url-generic
          browse-url-generic-program "chromium")

;;; Smex
(need-package 'smex)
(global-set-key [(meta x)] (lambda ()
                            (interactive)
                            (or (boundp 'smex-cache)
                                (smex-initialize))
                            (global-set-key [(meta x)] 'smex)
                            (smex)))

(global-set-key [(shift meta x)] (lambda ()
                                   (interactive)
                                   (or (boundp 'smex-cache)
                                       (smex-initialize))
                                   (global-set-key [(shift meta x)] 'smex-major-mode-commands)
                                   (smex-major-mode-commands)))
;;;; Paredit
(need-package 'paredit)
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(add-hook 'clojure-mode-hook          #'enable-paredit-mode)

(require 'eldoc) ; if not already loaded
    (eldoc-add-command
     'paredit-backward-delete
     'paredit-close-round)

(add-hook 'slime-repl-mode-hook (lambda () (paredit-mode +1)))

;; Stop SLIME's REPL from grabbing DEL,
;; which is annoying when backspacing over a '('
(defun override-slime-repl-bindings-with-paredit ()
  (define-key slime-repl-mode-map
    (read-kbd-macro paredit-backward-delete-key) nil))
(add-hook 'slime-repl-mode-hook 'override-slime-repl-bindings-with-paredit)

(defvar electrify-return-match
    "[\]}\)\"]"
    "If this regexp matches the text after the cursor, do an \"electric\"
  return.")

(defun electrify-return-if-match (arg)
    "If the text after the cursor matches `electrify-return-match' then
  open and indent an empty line between the cursor and the text.  Move the
  cursor to the new line."
    (interactive "P")
    (let ((case-fold-search nil))
      (if (looking-at electrify-return-match)
	  (save-excursion (newline-and-indent)))
      (newline arg)
      (indent-according-to-mode)))
  ;; Using local-set-key in a mode-hook is a better idea.
  (global-set-key (kbd "RET") 'electrify-return-if-match)

  (defun paredit-barf-all-the-way-backward ()
    (interactive)
    (paredit-split-sexp)
    (paredit-backward-down)
    (paredit-splice-sexp))
  (defun paredit-barf-all-the-way-forward ()
    (interactive)
    (paredit-split-sexp)
    (paredit-forward-down)
    (paredit-splice-sexp)
    (if (eolp) (delete-horizontal-space)))
  (defun paredit-slurp-all-the-way-backward ()
    (interactive)
    (catch 'done
      (while (not (bobp))
        (save-excursion
          (paredit-backward-up)
          (if (eq (char-before) ?\()
              (throw 'done t)))
        (paredit-backward-slurp-sexp))))
  (defun paredit-slurp-all-the-way-forward ()
    (interactive)
    (catch 'done
      (while (not (eobp))
        (save-excursion
          (paredit-forward-up)
          (if (eq (char-after) ?\))
              (throw 'done t)))
        (paredit-forward-slurp-sexp))))
  ;; (nconc paredit-commands
  ;;        '("Extreme Barfage & Slurpage"
  ;;          (("C-M-)")
  ;;                       paredit-slurp-all-the-way-forward
  ;;                       ("(foo (bar |baz) quux zot)"
  ;;                        "(foo (bar |baz quux zot))")
  ;;                       ("(a b ((c| d)) e f)"
  ;;                        "(a b ((c| d)) e f)"))
  ;;          (("C-M-}" "M-F")
  ;;                       paredit-barf-all-the-way-forward
  ;;                       ("(foo (bar |baz quux) zot)"
  ;;                        "(foo (bar|) baz quux zot)"))
  ;;          (("C-M-(")
  ;;                       paredit-slurp-all-the-way-backward
  ;;                       ("(foo bar (baz| quux) zot)"
  ;;                        "((foo bar baz| quux) zot)")
  ;;                       ("(a b ((c| d)) e f)"
  ;;                        "(a b ((c| d)) e f)"))
  ;;          (("C-M-{" "M-B")
  ;;                       paredit-barf-all-the-way-backward
  ;;                       ("(foo (bar baz |quux) zot)"
  ;;                        "(foo bar baz (|quux) zot)"))))
  ;; (paredit-define-keys)
  ;; (paredit-annotate-mode-with-examples)
  ;; (paredit-annotate-functions-with-examples)



;; (defun paredit-delete-indentation (&optional arg)
;;     "Handle joining lines that end in a comment."
;;     (interactive "*P")
;;     (let (comt)
;;       (save-excursion
;;         (move-beginning-of-line (if arg 1 0))
;;         (when (skip-syntax-forward "^<" (point-at-eol))
;; 	  (setq comt (delete-and-extract-region (point) (point-at-eol)))))
;;       (delete-indentation arg)
;;       (when comt
;;         (save-excursion
;;       	  (move-end-of-line 1)
;; 	  (insert " ")
;; 	  (insert comt)))))
;;   (define-key paredit-mode-map (kbd "M-^") 'paredit-delete-indentation)

(eval-after-load "paredit.el"
   '(require-package 'paredit-menu))


;; Forces the messages to 0, and kills the *Messages* buffer - thus disabling it on startup.
;(setq-default message-log-max nil)
(kill-buffer "*Messages*")

;; Show only one active window when opening multiple files at the same time.
(add-hook 'window-setup-hook 'delete-other-windows)

(setq scroll-margin 12)
(setq scroll-step 1)
;(require-package 'color-theme-sanityinc-solarized)
;(color-theme-sanityinc-solarized-dark)

;(load-theme 'solarized t)

;; PKGBUILDs
(autoload 'pkgbuild-mode "pkgbuild-mode.el" "PKGBUILD mode." t)
(setq auto-mode-alist (append '(("/PKGBUILD$" . pkgbuild-mode)) auto-mode-alist))

;; Markdown
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

;; for over-80-chars line highlightning
(need-package 'column-enforce-mode)
(add-hook 'prog-mode-hook 'column-enforce-mode)

(load-file "~/.jabber-accs.el")
(require 'notify)

(defun notify-jabber-notify (from buf text proposed-alert)
    "(jabber.el hook) Notify of new Jabber chat messages via notify.el"
	  (when (or jabber-message-alert-same-buffer
				            (not (memq (selected-window) (get-buffer-window-list buf))))
		    (if (jabber-muc-sender-p from)
				        (notify (format "(PM) %s"
										                       (jabber-jid-displayname (jabber-jid-user from)))
								               (format "%s: %s" (jabber-jid-resource from) text)))
			      (notify (format "%s" (jabber-jid-displayname from))
						               text)))

(add-hook 'jabber-alert-message-hooks 'notify-jabber-notify)
(setq eval-expression-debug-on-error t) 
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Liberation Mono" :foundry "unknown" :slant normal :weight normal :height 98 :width normal)))))
 ;; '(company-preview ((t (:foreground "darkgray" :underline t))))
 ;; '(company-preview-common ((t (:inherit company-preview))))
 ;; '(company-tooltip ((t (:background "lightgray" :foreground "black"))))
 ;; '(company-tooltip-common ((((type x)) (:inherit company-tooltip :weight bold)) (t (:inherit company-tooltip))))
 ;; '(company-tooltip-common-selection ((((type x)) (:inherit company-tooltip-selection :weight bold)) (t (:inherit company-tooltip-selection))))
 ;; '(company-tooltip-selection ((t (:background "steelblue" :foreground "white")))))

;; Web developement
(need-package 'web-mode)
(need-package 'js2-mode)
(need-package 'jquery-doc)
(require 'jquery-doc)
(add-hook 'js-mode-hook 'js2-mode)
(add-hook 'js2-mode-hook '(lambda () 
                            (local-set-key (kbd "{") 'paredit-open-curly)
                            (local-set-key (kbd "}") 'paredit-close-curly-and-newline)
                            (jquery-doc-setup)))
; js2-mode provides 4 level of syntax highlighting. They are 
;  * 0 or a negative value means none. 
;  * 1 adds basic syntax highlighting. 
;  * 2 adds highlighting of some Ecma built-in properties. 
;  * 3 adds highlighting of many Ecma built-in functions.
(setq js2-highlight-level 3)

;;
;; key chord
;;
(need-package 'key-chord)
(require 'key-chord)
(key-chord-mode 1)

;;
;; ace jump mode major function
;; 
(need-package 'ace-jump-mode)
(autoload
    'ace-jump-mode
      "ace-jump-mode"
        "Emacs quick move minor mode"
          t)
;; you can select the key you prefer to
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(key-chord-define-global "fj" 'ace-jump-mode)




;; 
;; enable a more powerful jump back function from ace jump mode
;;
(autoload
    'ace-jump-mode-pop-mark
      "ace-jump-mode"
        "Ace jump back:-)"
          t)
(eval-after-load "ace-jump-mode"
    '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)


;;
;; expand region
;;
(need-package 'expand-region)
(require 'expand-region)
(key-chord-define-global "zj" 'er/expand-region)
(key-chord-define-global "zk" 'er/contract-region)
(delete-selection-mode)

;;
;; multiple cursors
;;
(need-package 'multiple-cursors)
(require 'multiple-cursors)
(key-chord-define-global "mf" 'mc/edit-lines)
(key-chord-define-global "fn" 'mc/mark-next-like-this)
(key-chord-define-global "fp" 'mc/mark-previous-like-this)
(key-chord-define-global "fl" 'mc/mark-all-like-this)

;;
;; tagedit
;;
(need-package 'tagedit)
(eval-after-load "sgml-mode"
  '(progn
          (require 'tagedit)
               (tagedit-add-paredit-like-keybindings)
                    (add-hook 'html-mode-hook (lambda () (tagedit-mode 1)))))

;;
;; emmet mode
;;
(need-package 'emmet-mode)
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
(setq emmet-move-cursor-between-quotes t) ;; default nil

;;
;; yasnippet
;;
(need-package 'yasnippet)

;;
;; tramp mode for fast open files with sudo
;;
(require 'tramp)
