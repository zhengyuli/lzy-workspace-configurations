;;; package --- init-sh-script-mode.el ---
;; Time-stamp: <2018-12-10 18:43:57 Monday by lli>

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
;;   (require 'ininit-sh-script-mode
;;; Require:

;;; Code:
;; ==================================================================================
(defun sh-script-settings ()
  "Settings for `sh-script'."

  ;; ----------------------------------------------------------
  ;; Key bindings for `sh-mode-map'
  (lazy-set-key
   '(("C-c C-f" . template-expand-template)
     ("C-c C-c" . smart-comment))
   sh-mode-map))

(eval-after-load "sh-script" '(sh-script-settings))

;; ==================================================================================
;;; Provide features
(provide 'init-sh-script-mode)

;;; init-sh-script-mode.el ends here
