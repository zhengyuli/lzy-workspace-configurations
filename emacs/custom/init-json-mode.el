;;; package --- init-json-mode.el ---
;; Time-stamp: <2018-12-10 18:43:14 Monday by lli>

;; Copyright (C) 2018 zhengyu li
;;
;; Author: zhengyu li <lizhengyu419@outlook.com>
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
;;   (require 'init-json-mode)

;;; Require:
(require 'json-mode-autoloads)

;;; Code:
;; ==================================================================================
(defun json-mode-settings ()
  "Settings for `json-mode'."

  ;; Require
  (require 'lazy-set-key)

  ;; ----------------------------------------------------------
  ;; Key bindings for `json-mode-map'
  (lazy-set-key
   '(("C-x <tab>" . json-mode-beautify))
   json-mode-map))

(eval-after-load "json-mode" '(json-mode-settings))

;; ==================================================================================
;;; Provide features
(provide 'init-json-mode)

;;; init-json-mode.el ends here
