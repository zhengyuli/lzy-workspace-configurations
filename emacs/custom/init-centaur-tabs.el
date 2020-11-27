;;; package --- init-centaur-tabs.el ---
;; Time-stamp: <2020-11-27 12:18:56 Friday by lizhengyu>

;; Copyright (C) 2013 zhengyu li
;;
;; Author: zhengyu li <lizhengyu419@gmail.com>
;; Keywords: none

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'init-centaur-tabs)

;;; Require:
(require 'uniquify)
(require 'centaur-tabs)
(require 'lazy-set-key)

;;; Code:
;; ==================================================================================
;; Customize centaur tabs realted faces
(custom-set-faces `(centaur-tabs-default ((t :background ,emacs-config-default-background))))
(custom-set-faces '(centaur-tabs-unselected ((t :background "#333333" :foreground "#999999"))))
(custom-set-faces '(centaur-tabs-selected ((t :background "#666666" :foreground "#00BFFF"))))
(custom-set-faces '(centaur-tabs-unselected-modified	((t :background "#333333" :foreground "#FFD700"))))
(custom-set-faces '(centaur-tabs-selected-modified ((t :background "#666666" :foreground "#FFD700"))))

;; Customize centaur tabs realted variables
(customize-set-variable 'centaur-tabs-style "bar")
(customize-set-variable 'centaur-tabs-set-icons t)
(customize-set-variable 'centaur-tabs-cycle-scope 'tabs)

(customize-set-variable 'uniquify-separator "/")
(customize-set-variable 'uniquify-buffer-name-style 'forward)

(centaur-tabs-headline-match)

;; Customize `centaur-tabs-buffer-groups'
(defun centaur-tabs-buffer-groups ()
  "Return the list of group names the current buffer belongs to.
Return a list of one element based on major mode."
  (list
   (cond
	((memq major-mode '(magit-process-mode
							magit-status-mode
							magit-diff-mode
							magit-log-mode
							magit-file-mode
							magit-blob-mode
							magit-blame-mode))
	 "Magit"
	 )
	((memq major-mode
		   '(help-mode apropos-mode Info-mode Man-mode))
	 "Help"
	 )
	((memq major-mode
		   '(rmail-mode
			 rmail-edit-mode vm-summary-mode vm-mode mail-mode
			 mh-letter-mode mh-show-mode mh-folder-mode
			 gnus-summary-mode message-mode gnus-group-mode
			 gnus-article-mode score-mode gnus-browse-killed-mode))
	 "Mail"
	 )
	((memq major-mode '(org-mode org-agenda-mode diary-mode))
	 "OrgMode"
	 )
	((derived-mode-p 'dired-mode)
	 "Dired"
	 )
	((derived-mode-p 'term-mode)
	 "Terminal"
	 )
	((derived-mode-p 'eshell-mode)
	 "EShell"
	 )
	((and (not (string-equal "*scratch*" (buffer-name)))
		  (derived-mode-p 'emacs-lisp-mode))
	 "Elisp"
	 )
	((string-equal "*" (substring (buffer-name) 0 1))
	 "Emacs"
	 )
	(t
	 (centaur-tabs-get-group-name (current-buffer))
	 )
	)))

;; ==================================================================================
;; Key bindings for `centaur-tabs-mode-map'
(lazy-set-key
 '(("M-p" . centaur-tabs-backward)
   ("M-n" . centaur-tabs-forward)
   ("M-P" . centaur-tabs-counsel-switch-group)
   ("M-N" . centaur-tabs-counsel-switch-group))
 centaur-tabs-mode-map)

;; ==================================================================================
;; Enable global centaur-tabs mode
(centaur-tabs-mode 1)

;; ==================================================================================
;;; Provide features
(provide 'init-centaur-tabs)

;;; init-centaur-tabs.el ends here
