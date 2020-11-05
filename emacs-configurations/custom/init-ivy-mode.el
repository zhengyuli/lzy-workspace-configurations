;;; package --- init-ivy-mode.el ---
;; Time-stamp: <2020-11-05 10:04:36 Thursday by lizhengyu>

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
;;   (require 'init-ivy-mode)

;;; Require:
(require 'ivy)
(require 'swiper)
(require 'counsel)
(require 'lazy-set-key)

;;; Code:
;; ==================================================================================
;; Customize ivy related variables
(customize-set-variable 'ivy-use-virtual-buffers t)
(customize-set-variable 'ivy-height 10)
(customize-set-variable 'ivy-count-format "")
(customize-set-variable 'ivy-initial-inputs-alist nil)
(customize-set-variable 'ivy-re-builders-alist '((t . ivy--regex-ignore-order)))

;; ==================================================================================
;; Global key bindings for `ivy'
(lazy-set-key
 '(("C-s" . swiper)
   ("M-x" . counsel-M-x)
   ("C-x C-f" . counsel-find-file)
   ("C-x b" . ivy-switch-buffer)
   ("C-x B" . counsel-recentf)))

;; ==================================================================================
;; Enable global ivy mode
(ivy-mode 1)

;; ==================================================================================
;;; Provide features
(provide 'init-ivy-mode)

;;; init-ivy-mode.el ends here
