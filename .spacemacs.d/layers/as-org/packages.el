(defconst as-org-packages
  '(org
    org-drill))

(defun as-org/init-org-drill ()
  (use-package org-drill
    :defer t))

(defun as-org/post-init-org ()
  (require 'org-protocol)
  (add-to-list 'org-modules 'org-protocol))
  ;; (add-to-list 'org-modules 'org-habit))
