;;; eh-theme.el --- eh
;;; Version: 1.0
;;; Commentary:
;;; A theme called eh
;;; Code:

(deftheme eh "DOCSTRING for eh")
  (custom-theme-set-faces 'eh
   '(default ((t (:foreground "#f9f7ec" :background "#1e1e20" ))))
   '(cursor ((t (:background "#f7f5e7" ))))
   '(fringe ((t (:background "#332d2d" ))))
   '(mode-line ((t (:foreground "#060202" :background "#d8d6d4" ))))
   '(region ((t (:background "#434240" ))))
   '(secondary-selection ((t (:background "#72706f" ))))
   '(font-lock-builtin-face ((t (:foreground "#ffd73d" ))))
   '(font-lock-comment-face ((t (:foreground "#878583" ))))
   '(font-lock-function-name-face ((t (:foreground "#db76e7" ))))
   '(font-lock-keyword-face ((t (:foreground "#24cc91" ))))
   '(font-lock-string-face ((t (:foreground "#f2d711" ))))
   '(font-lock-type-face ((t (:foreground "#5f96f0" ))))
   '(font-lock-constant-face ((t (:foreground "#c71807" ))))
   '(font-lock-variable-name-face ((t (:foreground "#f08b1a" ))))
   '(minibuffer-prompt ((t (:foreground "#b8bb26" :bold t ))))
   '(font-lock-warning-face ((t (:foreground "red" :bold t ))))
   )

;;;###autoload
(and load-file-name
    (boundp 'custom-theme-load-path)
    (add-to-list 'custom-theme-load-path
                 (file-name-as-directory
                  (file-name-directory load-file-name))))
;; Automatically add this theme to the load path

(provide-theme 'eh)

;;; eh-theme.el ends here
