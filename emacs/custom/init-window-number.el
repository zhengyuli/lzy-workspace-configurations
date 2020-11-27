;;; package --- init-window-number.el ---
;; Time-stamp: <2020-11-27 13:44:09 Friday by lizhengyu>

;; Copyright (C) 2016 zhengyu li
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
;;   (require 'init-window-number)

;;; Require:
(require 'window-number)

;;; Code:
;; ==================================================================================
;; Customize window number related variables
(customize-set-variable 'window-number-active-foreground "blue")
(customize-set-variable 'window-number-active-background nil)
(customize-set-variable 'window-number-inactive-foreground "blue")
(customize-set-variable 'window-number-inactive-background nil)

;; ==================================================================================
;; Global Key bindings for `window-number'
(lazy-set-key
 '(("C-<left>" . shrink-window-horizontally)
   ("C-<right>" . enlarge-window-horizontally)
   ("C-<down>" . shrink-window)
   ("C-<up>" . enlarge-window)))

;; ==================================================================================
;; Enable global window number mode
(window-number-mode 1)

;; Enable global window number meta mode
(window-number-meta-mode 1)

;; ==================================================================================
;;; Provide features
(provide 'init-window-number)

;;; init-window-number.el ends here
