;;; package --- init-google-translate.el ---
;; Time-stamp: <2018-12-10 18:42:43 Monday by lli>

;; Copyright (C) 2016 zhengyu li
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
;;   (require 'init-google-translate)

;;; Require:
(require 'google-translate-autoloads)
(require 'lazy-set-key)

;;; Code:
;; ==================================================================================
(defun google-translate-settings ()
  "Settings for `google-translate'."

  ;; ----------------------------------------------------------
  ;; Customize google translate related variables
  (customize-set-variable 'google-translate-translation-directions-alist '(("en" . "zh-CN") ("zh-CN" . "en"))))

(eval-after-load "google-translate-smooth-ui" '(google-translate-settings))

;; ==================================================================================
;; Global Key bindings for `google-translate'
(lazy-set-key
 '(("C-x p" . google-translate-smooth-translate)))

;; ==================================================================================
;;; Provide features
(provide 'init-google-translate)

;;; init-google-translate.el ends here
