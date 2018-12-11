;;; package --- init-view-mode.el ---
;; Time-stamp: <2018-12-10 18:44:28 Monday by lli>

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
;;   (require 'init-view-mode)

;;; Require:

;;; Code:
;; ==================================================================================
(defun view-mode-settings ()
  "Settings for `view'."

  ;; Require
  (require 'lazy-set-key)

  ;; ----------------------------------------------------------
  ;; Key bindings for `view-mode-map'
  (lazy-set-key
   '(("n" . next-line)
     ("p" . previous-line))
   view-mode-map))

(eval-after-load "view" '(view-mode-settings))

;; ==================================================================================
;;; Provide features
(provide 'init-view-mode)

;;; init-view-mode.el ends here
