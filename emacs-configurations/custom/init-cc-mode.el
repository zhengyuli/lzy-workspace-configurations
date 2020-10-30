;;; package --- init-cc-mode.el ---
;; Time-stamp: <2020-10-30 10:54:46 Friday by lizhengyu>

;; Copyright (C) 2014 zhengyu li
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
;;   (require 'init-cc-mode)

;;; Require:

;;; Code:
;; ==================================================================================
(defun cc-mode-settings ()
  "Settings for `cc-mode'."

  ;; ----------------------------------------------------------
  ;; Key bindings for `cc-mode-base-map'
  (lazy-set-key
   '(("C-c C-c" . smart-comment))
   c-mode-base-map)

  ;; Set `prog-mode-map' as the parent of `c-mode-base-map'
  (set-keymap-parent c-mode-base-map prog-mode-map))

(eval-after-load "cc-mode" '(cc-mode-settings))

;; ==================================================================================
;;; Provide features
(provide 'init-cc-mode)

;;; init-cc-mode.el ends here
