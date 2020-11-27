;;; package --- init-color-rg.el ---
;; Time-stamp: <2020-11-27 17:23:32 Friday by lizhengyu>

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
;;   (require 'init-color-rg)

;;; Require:
(require 'color-rg)
(require 'lazy-set-key)

;;; Code:
;; ==================================================================================
;; Key bindings for `color-rg-mode-map'
(lazy-set-key
 '(("p" . color-rg-jump-prev-keyword)
   ("n" . color-rg-jump-next-keyword)
   ("o" . color-rg-open-file-and-stay))
 color-rg-mode-map)

;; Global Key bindings for `color-rg'
(lazy-set-key
 '(("C-x C-u"  . color-rg-search-input-in-current-file)
   ("C-x g"    . color-rg-search-input)
   ("C-x G"    . color-rg-search-input-in-project)))

;; ==================================================================================
;;; Provide features
(provide 'init-color-rg)

;;; init-color-rg.el ends here
