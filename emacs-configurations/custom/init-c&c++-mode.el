;;; package --- init-c&c++-mode.el ---
;; Time-stamp: <2020-11-04 15:29:11 Wednesday by lizhengyu>

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
;;   (require 'init-c&c++-mode)

;;; Require:

;;; Code:
;; ==================================================================================
(defun rtags-cmake-export-commands (root-dir)
  "Call `cmake' to export `compile_commands.json' for rtags to index."
  (interactive (list (read-directory-name "Project root directory: " "./")))
  (let ((source-dir root-dir)
		(build-dir (expand-file-name ".cmake_rtags_build" root-dir)))
	(shell-command
	 (format "cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -S %s -B %s" source-dir build-dir)
	 nil "*_CMAKE_Export_Errors_*")))

(defun rtags-index-project (root-dir)
  "Call `rtags-rc' to index project."
  (interactive (list (read-directory-name "Project root directory: " "./")))
  (let ((rtags-exec-path (if (executable-find "rc")
							 (executable-find "rc")
						   (executable-find "rtags-rc")))
		(source-dir root-dir)
		(build-dir (expand-file-name ".cmake_rtags_build" root-dir)))
	(if (not (file-exists-p (expand-file-name "compile_commands.json" build-dir)))
		(cond ((file-exists-p (expand-file-name "CMakeLists.txt" source-dir))
			   (rtags-cmake-export-commands source-dir))
			  (t (error "Unsupported C/C++ project, should be managed by cmake..."))))
	(shell-command (concat rtags-exec-path " -J " build-dir) nil "*_RTAGS_Index_Errors_*")))

(defun c&c++-mode-settings ()
  "Settings for `c-mode' and `c++-mode'."

  ;; Require
  (require 'ctypes)
  (require 'rtags-xref)
  (require 'company-rtags)
  (require 'google-c-style)

  ;; ----------------------------------------------------------
  ;; Customize c&c++ mode related variables
  (customize-set-variable 'ctypes-file-name "~/.emacs.d/ctypes")
  (customize-set-variable 'ctypes-write-types-at-exit t)
  (customize-set-variable 'rtags-completions-enabled t)
  (customize-set-variable 'rtags-autostart-diagnostics t)

  ;; Enable google style newline indent
  (google-make-newline-indent)

  ;; ----------------------------------------------------------
  ;; Hooks for `c-mode' and `c++-mode'
  (dolist (hook '(c-mode-hook c++-mode-hook))
	(add-hook hook (lambda ()
					 (ctypes-auto-parse-mode 1)
					 (ctypes-read-file nil nil t t)
					 (rtags-diagnostics t)
					 (make-local-variable 'company-backends)
					 (add-to-list 'company-backends (append-backend-with-yas 'company-rtags))
					 (rtags-start-process-unless-running)
					 (rtags-xref-enable)
					 (google-set-c-style)))))

(eval-after-load "cc-mode" '(c&c++-mode-settings))

;; ==================================================================================
;;; Provide features
(provide 'init-c&c++-mode)

;;; init-c&c++-mode.el ends here
