;;; package --- init-undo-tree.el ---
;; Time-stamp: <2018-12-10 18:44:22 Monday by lli>

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
;;   (require 'init-undo-tree)

;;; Require:
(require 'undo-tree)
(require 'lazy-set-key)

;;; Code:
;; ==================================================================================
;; Key bindings for `undo-tree-map'
(lazy-unset-key
 '("C-x u" "M-_")
 undo-tree-map)

(lazy-set-key
 '(("M-O"  . undo-tree-visualize))
 undo-tree-map)

;; ==================================================================================
;; Enable global undo tree mode
(global-undo-tree-mode 1)

;; ==================================================================================
;;; Provide features
(provide 'init-undo-tree)

;;; init-undo-tree.el ends here
