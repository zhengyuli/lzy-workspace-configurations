;;; package --- init-tty-format.el ---
;; Time-stamp: <2019-09-11 10:33:19 Wednesday by lli>

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
;;   (require 'init-tty-format)

;;;Require:
(require 'tty-format-autoloads)

;;; Code:
;; ==================================================================================
(defun display-ansi-colors ()
  "Explicitly decode ANSI color escape sequences."
  (interactive)
  (format-decode-buffer 'ansi-colors))

;; ==================================================================================
;; Hooks for `tty-format'
(add-hook 'find-file-hooks 'tty-format-guess)

;; ==================================================================================


;;; Provide features
(provide 'init-tty-format)

;;; init-tty-format.el ends here
