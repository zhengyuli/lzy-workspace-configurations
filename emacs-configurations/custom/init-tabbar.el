;;; package --- init-tabbar.el ---
;; Time-stamp: <2018-12-10 18:44:03 Monday by lli>

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
