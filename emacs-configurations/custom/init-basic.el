;;; package --- init-basic.el ---
;; Time-stamp: <2019-03-27 10:51:54 Wednesday by lli>

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
;;   (require 'init-basic)

;;; Require:
(require 'epa)
(require 'recentf)
(require 'time-stamp)
(require 'goto-chg)
(require 'cursor-chg)
(require 'expand-region)
(require 'smooth-scrolling)
(require 'lazy-set-key)

;;; Code:
;; ==================================================================================
(defun indent-buffer ()
  "Automatic format current buffer."
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)
    (delete-trailing-whitespace)
    (untabify (point-min) (point-max))))

(defun smart-indent ()
  "If mark is active, indent region, else indent all buffer."
  (interactive)
  (save-excursion
    (if mark-active
        (call-interactively 'indent-region)
      (call-interactively 'indent-buffer))))

(defun copy-region ()
  "Copy region."
  (interactive)
  (copy-region-as-kill (region-beginning) (region-end)))

(defun copy-curr-line ()
  "Copy current line."
  (interactive)
  (let ((end (min (point-max) (line-end-position))))
    (copy-region-as-kill (line-beginning-position) end)))

(defun smart-copy ()
  "If mark is active, copy region, else copy current line."
  (interactive)
  (save-excursion
    (if mark-active
        (call-interactively 'copy-region)
      (call-interactively 'copy-curr-line))))

(defun smart-kill ()
  "If mark is active, kill region, else kill whole line."
  (interactive)
  (if mark-active
      (call-interactively 'kill-region)
    (call-interactively 'kill-whole-line)))

(defun get-mode-name ()
  "Display major mode and mode name."
  (interactive)
  (message "major-mode: %s, mode-name: %s" major-mode mode-name))

(defun toggle-fullscreen ()
  "Toggle full screen."
  (interactive)
  (let ((current-value (frame-parameter nil 'fullscreen)))
    (set-frame-parameter
     nil
     'fullscreen
     (if (equal 'fullboth current-value)
         (if (boundp 'old-fullscreen)
             old-fullscreen
           nil)
       (progn
         (setq old-fullscreen current-value)
         'fullboth)))))

;; ==================================================================================
;; Customize tab width to 4
(customize-set-variable 'tab-width 4)

;; Set additional line space to 3 pixels
(customize-set-variable 'line-spacing 3)

;; Ignore ring bell
(customize-set-variable 'ring-bell-function 'ignore)

;; Inhibit loading the `default' library
(customize-set-variable 'inhibit-default-init t)

;; Inhibit the startup screen
(customize-set-variable 'inhibit-startup-screen t)

;; Inhibit the initial startup message
(customize-set-variable 'inhibit-startup-message t)

;; Inhibit the initial startup echo area message
(customize-set-variable 'inhibit-startup-echo-area-message t)

;; Enable scrolling during incremental search
(customize-set-variable 'isearch-allow-scroll t)

;; Customize time stamp format
(customize-set-variable 'time-stamp-format "%04y-%02m-%02d %02H:%02M:%02S %:a by %u")

;; Enable to add a newline automatically at the end of the file
(customize-set-variable 'require-final-newline t)

;; Enable to auto save every file-visiting buffer
(customize-set-variable 'auto-save-default nil)

;; Customize alist of filename patterns and backup directory names
(customize-set-variable 'backup-directory-alist `((".*" . ,(concat user-emacs-directory "backup-files"))))

;; Always use copying to create backup files
(customize-set-variable 'backup-by-copying t)

;; Delete excess backup versions silently
(customize-set-variable 'delete-old-versions t)

;; Enable version numbers for backup files
(customize-set-variable 'version-control t)

;; Query passphrase through the minibuffer
(customize-set-variable 'epa-pinentry-mode 'loopback)

;; Set maximum number of items of the recent list to 1000
(customize-set-variable 'recentf-max-saved-items 1000)

;; Exclude tmp and remote items from recent list
(customize-set-variable 'recentf-exclude '("/tmp/" "ssh:"))

;; Customize user full name
(customize-set-variable 'user-full-name "zhengyu li")

;; Customize user mail address
(customize-set-variable 'user-mail-address "lizhengyu419@outlook.com")

;; Replace yes-or-no-p with y-or-no-p
(fset 'yes-or-no-p 'y-or-n-p)

;; Move the mouse to the upper-right corner on any keypress
(mouse-avoidance-mode "banish")

;; Exec path hack for mac system
(when (memq window-system '(mac ns))
  (require 'exec-path-from-shell)
  (setq mac-command-modifier 'super)
  (setq mac-option-modifier 'meta)
  (exec-path-from-shell-initialize))

;; ==================================================================================
;; Global Key bindings for `basic'
(lazy-set-key
 '(("C-x C-b" . ibuffer)
   ("C-x m" . get-mode-name)
   ("C-x k" . kill-this-buffer)
   ("C-x <tab>" . smart-indent)
   ("C-x TAB" . smart-indent)
   ("M-m" . set-mark-command)
   ("M-M" . er/expand-region)
   ("M-w" . smart-copy)
   ("M-k" . smart-kill)
   ("M-g" . goto-line)
   ("M-o" . goto-last-change)
   ("M-_" . text-scale-decrease)
   ("M-+" . text-scale-increase)
   ("C-<f10>" . toggle-fullscreen)))

;; ==================================================================================
;; Hooks for `basic'
(add-hook 'write-file-hooks 'time-stamp)

;; ==================================================================================
;; Disable blink cursor mode
(blink-cursor-mode -1)

;; Disable tool bar mode
(tool-bar-mode -1)

;; Disable scroll bar mode
(scroll-bar-mode -1)

;; Enable cursor type change when idle
(toggle-cursor-type-when-idle 1)

;; Enable global auto revert mode
(global-auto-revert-mode 1)

;; Enable global column number mode
(column-number-mode 1)

;; Enable global just-in-time lock mode
(jit-lock-mode 1)

;; Enable global recentf mode
(recentf-mode 1)

;; Enable global change cursor mode
(change-cursor-mode 1)

;; Enable global smooth scrolling mode
(smooth-scrolling-mode 1)

;; ==================================================================================
;;; Provide features
(provide 'init-basic)

;;; init-basic.el ends here
