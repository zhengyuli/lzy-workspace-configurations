;;; package --- init-moccur.el ---
;; Time-stamp: <2018-12-10 18:43:36 Monday by lli>

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
;;   (require 'init-moccur)

;;; Require:
(require 'color-moccur-autoloads)
(require 'lazy-set-key)

;;; Code:
;; ==================================================================================
(defun moccur-settings ()
  "Settings for `moccur'."

  ;; Require
  (require 'moccur-edit)

  ;; ----------------------------------------------------------
  (defadvice moccur-edit-change-file (after save-after-moccur-edit-buffer activate)
    "Automatically save buffer when edit in moccur."
    (save-buffer))

  ;; ----------------------------------------------------------
  ;; Customize moccur related faces
  (custom-set-faces '(moccur-face ((t (:background "#EEEE00" :foreground "#000000" :weight bold)))))
  (custom-set-faces '(moccur-current-line-face ((t (:background "#4D4D4D")))))
  
  ;; Customize moccur related variables
  (customize-set-variable 'moccur-kill-moccur-buffer t)
  (customize-set-variable 'moccur-grep-default-word-near-point t)
  (customize-set-variable 'dmoccur-exclusion-mask (remove "\\.svn/.+" dmoccur-exclusion-mask))
  (customize-set-variable 'dmoccur-exclusion-mask (remove "\\.git/.+" dmoccur-exclusion-mask))
  (customize-set-variable 'dmoccur-exclusion-mask (remove "CVS/.+" dmoccur-exclusion-mask))
  (customize-set-variable 'dmoccur-exclusion-mask (append dmoccur-exclusion-mask '("/\\.svn/.+" "/\\.git/.+" "/CVS/.+")))
  (customize-set-variable 'moccur-edit-highlight-edited-text t)

  ;; ----------------------------------------------------------
  ;; Key bindings for `moccur-mode-map'
  (lazy-set-key
   '(("o" . other-window))
   moccur-mode-map))

(eval-after-load "color-moccur" '(moccur-settings))

;; ==================================================================================
;; Global Key bindings for `moccur'
(lazy-set-key
 '(("C-x C-u"  . occur-by-moccur)
   ("C-x g"    . moccur-grep-find)
   ("C-x G"    . moccur-grep)))

;; ==================================================================================
;;; Provide features
(provide 'init-moccur)

;;; init-moccur.el ends here
