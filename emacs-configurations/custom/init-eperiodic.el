;;; package --- init-eperiodic.el ---
;; Time-stamp: <2018-12-10 18:42:30 Monday by lli>

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
;;   (require 'init-eperiodic)

;;; Require:
(require 'eperiodic-autoloads)

;;; Code:
;; ==================================================================================
(defun eperiodic-settings ()
  "Settings for `eperiodic'."

  ;; ----------------------------------------------------------
  ;; Customize eperiodic related variables
  (customize-set-variable 'eperiodic-web-lookup-location
                          "http://www.webelements.com/webelements/elements/text/%s/key.html"))

(eval-after-load "eperiodic" '(eperiodic-settings))

;; ==================================================================================
;;; Provide features
(provide 'init-eperiodic)

;;; init-eperiodic.el ends here
