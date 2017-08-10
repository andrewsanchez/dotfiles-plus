(setq as-org-packages '(org))

(defun as-org/post-init-org ()

(global-set-key "\C-cr" 'hydra-refile/body)

;; h1
(define-key global-map "\C-ch"
  (lambda () (interactive) (org-capture nil "h")))
;; h2
(define-key global-map "\C-cs"
  (lambda nil (interactive) (copy-region-as-kill (region-beginning) (region-end)) (org-capture nil "s")))

;; Interactive capture
(define-key global-map "\C-ci"
  (lambda nil (interactive) (copy-region-as-kill (region-beginning) (region-end)) (org-capture nil "i")))

(define-key global-map "\C-cd"
  (lambda nil (interactive) (copy-region-as-kill (region-beginning) (region-end)) (org-capture nil "d")))

(setq org-capture-templates
      '(("t" "TODO" entry (file+headline "~/org/gtd.org" "Tasks")
         "* TODO %? \nAdded:  %U\n" :empty-lines 1)
        ("j" "Journal" entry (file+datetree "~/org/journal.org")
         "* %?\nEntered on %U\n")
        ("n" "note" entry (file+headline "~/org/notes.org" "Notes")
         "* %i\n")


        ;; Quick capture h1
        ("h" "QC-h1" entry (file "~/org/capture.org")
         "* %i" :immediate-finish t :empty-lines 1)

        ;; Quick capture h2
        ("s" "QC-h2" plain (file "~/org/capture.org")
         "** %(replace-regexp-in-string \"\n\" \"\" (current-kill 0))" :immediate-finish t :empty-lines 1)

        ;; Quick capture definition
        ("d" "QC-definition" entry (file+headline "~/org/capture.org" "Terminology")
         "* %(replace-regexp-in-string \"\n\" \"\" (current-kill 0))" :immediate-finish t :empty-lines 1)

        ;; Interactive capture
        ("i" "Interactive Capture" entry (file "~/org/capture.org")
         "* %(replace-regexp-in-string \"\n\" \"\" (current-kill 0))" :empty-lines 1)))

(setq org-agenda-files
      '("~/org/gtd.org"))
(setq org-agenda-default-appointment-duration 60)
(setq org-archive-location "~/org/journal.org::datetree/* Finished Tasks")

;; Quickly make cloze deletions for Anki cards
(defun wrap-text (b e txt)

(interactive "r\nc")
(save-restriction
 (narrow-to-region b e)
 (goto-char (point-min))
 (insert "{{c")
 (insert txt)
 (insert "::")
 (goto-char (point-max)) 
 (insert "::}}")
 ))

;; Babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '((ipython . t)
   ;; other languages..
   ))
(setq org-confirm-babel-evaluate nil)

(defun my-org-files-list ()
  (delq nil
        (mapcar (lambda (buffer)
                  (buffer-file-name buffer))
                (org-buffer-list 'files t))))

(setq org-refile-targets (quote (("~/org/capture.org" :maxlevel . 4)
                                 (my-org-files-list :maxlevel . 4)
                                 )))

;; insert todo respect content
(evil-leader/set-key-for-mode 'org-mode
  "ht" (lambda nil (interactive) (org-insert-heading-respect-content) (org-todo)))

;; insert todo subheading respect content
(evil-leader/set-key-for-mode 'org-mode
  "hT" (lambda nil (interactive) (org-insert-heading-respect-content) (org-metaright) (org-todo)))

;; start an unordered list item from a heading
(evil-leader/set-key-for-mode 'org-mode
  "o" (lambda nil (interactive) (evil-org-eol-call (quote (lambda nil (org-insert-heading) (org-metaright) (org-ctrl-c-minus))))))

;; create new heading promoted one level from the current heading
(evil-leader/set-key-for-mode 'org-mode
  "C-o" (lambda nil (interactive) (evil-org-eol-call (quote (lambda nil (org-insert-heading-respect-content) (org-metaleft) )))))

(evil-leader/set-key-for-mode 'org-mode "1" 'wrap-text)

(evil-leader/set-key-for-mode 'org-mode "SPC" 'helm-org-in-buffer-headings)

(setq org-publish-project-alist
      '(

        ("org-andrewsanchez"
         :base-directory "~/org"
         :base-extension "org"
         ;; Path to your Jekyll project.
         :publishing-directory "~/Projects/andrewsanchez.github.io/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4 
         :html-extension "html"
         :body-only t ;; Only export section between <body> </body>
         )
        ))

(setq org-clock-sound t)
 (setq org-tag-alist '(("work" . ?w) ("@home" . ?h) ("@computer" . ?c) ("10-min" . ?x) ("purchase" . ?p)))
'(org-agenda-default-appointment-duration 60)
'(org-agenda-files (quote ("~/org/gtd.org")))
'(org-agenda-restore-windows-after-quit t t)
'(org-clock-sound t)
'(org-default-notes-file "notes.org")
'(org-export-backends (quote (ascii html icalendar latex md odt)))
'(org-icalendar-use-scheduled (quote (event-if-not-todo event-if-todo)))
'(org-timer-default-timer "00:60:00")

(setq org-publish-project-alist
      '(

  ("org-andrewsanchez"
          ;; Path to your org files.
          :base-directory "~/projects/andrewsanchez/org/"
          :base-extension "org"

          ;; Path to your Jekyll project.
          :publishing-directory "~/projects/andrewsanchez/jekyll/"
          :recursive t
          :publishing-function org-publish-org-to-html
          :headline-levels 4 
          :html-extension "html"
          :body-only t ;; Only export section between <body> </body>
    )


    ("org-static-andrew"
          :base-directory "~/projects/andrewsanchez/org/"
          :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|php"
          :publishing-directory "~/projects/andrewsanchez/"
          :recursive t
          :publishing-function org-publish-attachment)

    ("andrew" :components ("org-andrewsanchez" "org-static-andrew"))
))

)
