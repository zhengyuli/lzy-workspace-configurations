;;; package --- init-visual-regex.el ---
;; Time-stamp: <2018-12-10 18:44:32 Monday by lli>

;; Copyright (C) 2015 zhengyu li
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
;;   (require 'init-visual-regex)

;;; Require:
(require 'visual-regexp-autoloads)
(require 'visual-regexp-steroids-autoloads)

;;; Code:
;; ==================================================================================
(defun visual-regexp-settings ()
  "Settings for `visual-regexp'."

  ;; Require
  (require 'lazy-set-key)

  ;; ----------------------------------------------------------
  ;; Key bindings for `vr/minibuffer-keymap'
  (lazy-set-key
   '(("C-p" . previous-history-element)
     ("C-n" . next-history-element))
   vr/minibuffer-keymap))

(eval-after-load "visual-regexp" '(visual-regexp-settings))

;; ==================================================================================
;;; Provide features
(provide 'init-visual-regex)

;;; init-visual-regex.el ends here
