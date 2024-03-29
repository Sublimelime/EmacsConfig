;; Text mode hooks

(add-hook 'text-mode-hook '(lambda () (setq-local sentence-end-double-space nil)))

;; Elisp mode hooks
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)

;; On buffer save hooks
(add-hook 'before-save-hook 'nm-clean-buffer)

;; Manual pages
(add-hook 'man-mode-hook 'visual-line-mode)

;; Ibuffer mode
(add-hook 'ibuffer-mode-hook
          '(lambda ()
             (ibuffer-auto-mode t)
             (ibuffer-switch-to-saved-filter-groups "Standard"))) ;; See plugin config for definition


;; C++ mode hooks
(defun nm-c++-mode-config ()
  "Runs several things to config the mode under one hook."
  ;; fix beginning of defun not working on some laptops
  (local-unset-key (kbd "C-M-a"))

  ;; Quick compile and run for 1 file projects
  (local-set-key (kbd "C-c c c") 'nm-compile-current-c-file)
  (local-set-key (kbd "C-c c r") 'nm-run-exec-file)
  (local-set-key (kbd "C-M-q") 'c-beginning-of-defun))

(add-hook 'c++-mode-hook 'display-line-numbers-mode) ;;native line numbers
(add-hook 'c++-mode-hook 'subword-mode)
(add-hook 'c++-mode-hook 'nm-c++-mode-config)
