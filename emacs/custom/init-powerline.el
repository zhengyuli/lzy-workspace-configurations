;;; package --- init-powerline.el ---
;; Time-stamp: <2020-12-01 14:55:02 Tuesday by lizhengyu>

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
;;   (require 'init-powerline)

;;; Require:
(require 'powerline)

;;; Code:
;; ==================================================================================
;; Customize centaur tabs realted faces
(custom-set-faces
 '(powerline-active1 ((t (:background "yellow" :foreground "black"))))
 '(powerline-active2 ((t (:background "blue" :foreground "black"))))
 '(powerline-inactive1 ((t (:background "yellow" :foreground "black"))))
 '(powerline-inactive2 ((t (:background "blue" :foreground "black"))))
 '(mode-line-buffer-id-inactive ((t :inherit mode-line-buffer-id))))

(powerline-default-theme)

;; ==================================================================================
;;; Provide features
(provide 'init-powerline)

;;; init-powerline.el ends here
