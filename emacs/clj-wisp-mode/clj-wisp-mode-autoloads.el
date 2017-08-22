(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

(add-to-list 'auto-mode-alist '("\\.w\\'" . clj-wisp-mode))
(add-to-list 'auto-mode-alist '("\\.cw\\'" . clj-wisp-mode))
(add-to-list 'auto-mode-alist '("\\.csw\\'" . clj-wisp-mode))

(add-hook 'clj-wisp-mode-hook (lambda nil (electric-indent-local-mode -1)))

(autoload 'clj-wisp--tab "clj-wisp-mode" "\
Cycle through indentations depending on the previous line.

\(fn)" t nil)

(autoload 'clj-wisp-mode "clj-wisp-mode" "\
Major mode for whitespace-to-lisp files.

  \\{clj-wisp-mode-map}

\(fn)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
