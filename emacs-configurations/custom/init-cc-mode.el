;;; package --- init-cc-mode.el ---
;; Time-stamp: <2018-12-10 18:41:16 Monday by lli>

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

  ;; Require
  (require 'ctypes)
  (require 'google-c-style)

  ;; ----------------------------------------------------------
  ;; Customize cc mode related variables
  (customize-set-variable 'ctypes-file-name "~/.emacs.d/ctypes")
  (customize-set-variable 'ctypes-write-types-at-exit t)

  ;; ----------------------------------------------------------
  ;; Key bindings for `cc-mode-base-map'
  (lazy-set-key
   '(("C-c C-c" . smart-comment))
   c-mode-base-map)

  ;; Enable google style newline indent
  (google-make-newline-indent)

  ;; Set `prog-mode-map' as the parent of `c-mode-base-map'
  (set-keymap-parent c-mode-base-map prog-mode-map)

  ;; ----------------------------------------------------------
  ;; Hooks for `cc-mode'
  (add-hook 'c-mode-common-hook (lambda ()
                                  (ctypes-auto-parse-mode 1)
                                  (ctypes-read-file nil nil t t)
                                  (google-set-c-style))))

(eval-after-load "cc-mode" '(cc-mode-settings))

;; ==================================================================================
;;; Provide features
(provide 'init-cc-mode)

;;; init-cc-mode.el ends here
