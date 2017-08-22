
(setq load-path (cons (file-truename "~/.emacs.d/clj-wisp-mode") load-path))

(require 'clj-wisp-mode)

;; org-mode for tangle
(defun wisp-call (new)
  (call-process "clj-wisp.sh" nil t nil buffer-file-name new)
  (message "clj-wisp tangled %s" new))

(defun clj-wisp-tangle-hook ()
  (let* ((ext (file-name-extension buffer-file-name))
         (dir (file-name-directory buffer-file-name))
         (base (file-name-base buffer-file-name)))
    (pcase ext
      ("cw" (wisp-call (concat dir base ".clj" )))
      ("csw" (wisp-call (concat dir base ".cljs" )))
      ("ccw" (wisp-call (concat dir base ".cljc" )))
      ("ew" (wisp-call (concat dir base ".el" )))
      ("w" (wisp-call (concat dir base ".scm" )))
      )))
(add-hook 'org-babel-post-tangle-hook #'clj-wisp-tangle-hook)

;; org-mode for edit return
(defun clj-wisp-return ()
  (interactive)
  (org-return-indent)
  (tab-to-tab-stop))

(global-set-key (kbd "M-n") 'clj-wisp-return)


(add-to-list 'auto-mode-alist '("\\.cw\\'" . clj-wisp-mode))
(add-to-list 'auto-mode-alist '("\\.csw\\'" . clj-wisp-mode))
(add-to-list 'auto-mode-alist '("\\.ccw\\'" . clj-wisp-mode))

