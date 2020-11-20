;;; package --- init-elisp-mode.el ---
;; Time-stamp: <2020-11-06 10:51:11 Friday by lizhengyu>

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
;;   (require 'init-elisp-mode)

;;; Require:

;;; Code:
;; ==================================================================================
(defun elisp-mode-settings ()
  "Settings for `elisp-mode'."

  ;; Require
  (require 'eldoc)
  (require 'elisp-slime-nav)
  (require 'lisp-extra-font-lock)

  ;; ----------------------------------------------------------
  ;; Font lock keyword for hexcolor
  (defvar hexcolor-keywords
    '(("#[[:xdigit:]]\\{6\\}"
       (0 (put-text-property
           (match-beginning 0)
           (match-end 0)
           'face (list :background (match-string-no-properties 0)))))))

  ;; ----------------------------------------------------------
  ;; Hooks for `elisp-mode'
  (add-hook 'emacs-lisp-mode-hook (lambda ()
                                    (eldoc-mode 1)
									(lisp-extra-font-lock-mode 1)
									(font-lock-add-keywords nil hexcolor-keywords)
                                    (turn-on-elisp-slime-nav-mode))))

(eval-after-load "elisp-mode" '(elisp-mode-settings))

;; ==================================================================================
;;; Provide features
(provide 'init-elisp-mode)

;;; init-elisp-mode.el ends here
