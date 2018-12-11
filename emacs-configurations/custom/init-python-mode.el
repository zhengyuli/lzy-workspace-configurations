;;; package --- init-python-mode.el ---
;; Time-stamp: <2018-12-10 18:43:50 Monday by lli>

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
;;   (require 'init-python-mode)

;;; Require:

;;; Code:
;; ==================================================================================
(defun python-mode-settings ()
  "Settings for `python-mode'."

  ;; Require
  (require 'py-yapf)
  (require 'sphinx-doc)
  (require 'python-docstring)
  (require 'jedi-core)
  (require 'anaconda-mode)
  (require 'company-anaconda)
  (require 'virtualenvwrapper)

  ;; ----------------------------------------------------------
  (defun sphinx-doc-format ()
    (interactive)
    (sphinx-doc)
    (python-docstring-fill))

  (defadvice venv-workon (after venv-workon-after activate)
    (jedi:stop-server))

  (defalias 'python-format 'py-yapf-buffer)

  ;; ----------------------------------------------------------
  ;; Key bindings for `python-mode-map'
  (lazy-set-key
   '(("C-c C-f" . template-expand-template)
     ("C-c C-c" . smart-comment)
     ("M-." . jedi:goto-definition)
     ("M-," . jedi:goto-definition-pop-marker)
     ("M-r" . anaconda-mode-find-references)
     ("M-*" . anaconda-mode-show-doc)
     ("C-c d f" . sphinx-doc-format))
   python-mode-map)

  ;; ----------------------------------------------------------
  ;; Hooks for `prog-mode'
  (add-hook 'python-mode-hook
            (lambda ()
              (make-local-variable 'company-backends)
              (add-to-list 'company-backends (append-backend-with-yas 'company-anaconda))
              (anaconda-mode 1)
              (sphinx-doc-mode 1)
              (python-docstring-mode 1)
              (venv-initialize-interactive-shells))))

(eval-after-load "python" '(python-mode-settings))

;; ==================================================================================
;;; Provide features
(provide 'init-python-mode)

;;; init-python-mode.el ends here
