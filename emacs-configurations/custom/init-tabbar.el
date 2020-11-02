;;; package --- init-tabbar.el ---
;; Time-stamp: <2020-11-02 13:44:06 Monday by lizhengyu>

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
;;   (require 'init-tabbar)

;;; Require:
(require 'tabbar)
(require 'lazy-set-key)

;;; Code:
;; ==================================================================================
;; Customize tabbar related faces
(custom-set-faces `(tabbar-default ((t :background ,emacs-config-default-background))))
(custom-set-faces '(tabbar-unselected ((t :background "#333333" :foreground "#999999"))))
(custom-set-faces '(tabbar-selected ((t :background "#666666" :foreground "#00BFFF" :box (:line-width -1 :style released-button)))))
(custom-set-faces '(tabbar-modified	((t :background "#333333" :foreground "#FFD700"))))
(custom-set-faces '(tabbar-selected-modified ((t :background "#666666" :foreground "#FFD700" :box (:line-width -1 :style released-button)))))

;; Customize tabbar realted variables
(customize-set-variable 'tabbar-buffer-home-button '(("") ""))
(customize-set-variable 'tabbar-scroll-left-button '(("") ""))
(customize-set-variable 'tabbar-scroll-right-button '(("") ""))

;; Customize `tabar-buffer-groups'
(defun tabbar-buffer-groups ()
  "Return the list of group names the current buffer belongs to.
Return a list of one element based on major mode."
  (list
   (cond
	((member (buffer-name)
			 '("*scratch*" "*Messages*"))
	 "Common"
	 )
	((eq major-mode 'dired-mode)
	 "Dired"
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
	((eq major-mode 'term-mode)
	 "Terminal")
	((or (get-buffer-process (current-buffer))
		 ;; Check if the major mode derives from `comint-mode' or
		 ;; `compilation-mode'.
		 (tabbar-buffer-mode-derived-p
		  major-mode '(comint-mode compilation-mode)))
	 "Process"
	 )
	(t
	 ;; Return `mode-name' if not blank, `major-mode' otherwise.
	 (if (and (stringp mode-name)
			  ;; Take care of preserving the match-data because this
			  ;; function is called when updating the header line.
			  (save-match-data (string-match "[^ ]" mode-name)))
		 mode-name
	   (symbol-name major-mode))
	 ))))

;; ==================================================================================
;; Key bindings for `tabbar'
(lazy-set-key
 '(("M-p" . tabbar-backward-tab)
   ("M-n" . tabbar-forward-tab)
   ("M-P" . tabbar-backward-group)
   ("M-N" . tabbar-forward-group))
 tabbar-mode-map)

;; ==================================================================================
;; Enable global tabbar mode
(tabbar-mode 1)

;; ==================================================================================
;;; Provide features
(provide 'init-tabbar)

;;; init-tabbar.el ends here
