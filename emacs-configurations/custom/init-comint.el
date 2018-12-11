;;; package --- init-comint-mode.el ---
;; Time-stamp: <2018-12-10 18:41:28 Monday by lli>

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
;;   (require 'init-comint)

;;; Require:

;;; Code:
;; ==================================================================================
(defun comint-settings ()
  "Settings for `comint'."

  ;; ----------------------------------------------------------
  ;; Customize comint related variables
  (customize-set-variable 'comint-prompt-read-only t)
  (customize-set-variable 'comint-scroll-to-bottom-on-input t)
  (customize-set-variable 'comint-scroll-to-bottom-on-output t)

  ;; ----------------------------------------------------------
  ;; Hooks for `comint'
  (add-hook 'comint-mode-hook (lambda ()
                                (auto-fill-mode -1)
                                (yas-minor-mode -1)
                                (company-mode -1))))

(eval-after-load "comint" '(comint-settings))

;; ==================================================================================
;;; Provide features
(provide 'init-comint)

;;; init-comint.el ends here
