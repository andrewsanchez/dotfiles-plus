(setq as/org (concat (getenv "HOME") "/Dropbox/org/")
      as/agenda (concat as/org "agenda/")
      as/views (concat as/org "views/")
      as/gtd (concat as/org "gtd.org")
      as/journal (concat as/org "journal.org")
      as/bookmarks (concat as/org "bookmarks.org")
      org-directory as/org)

(setq org-default-notes-file (concat as/org "notes.org")
      org-hide-leading-stars t
      org-todo-keywords
      '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)"))
      org-refile-targets '((nil :maxlevel . 2)
                           (org-agenda-files :maxlevel . 2))
      org-outline-path-complete-in-steps nil
      org-completion-use-ido nil
      org-refile-use-outline-path t)

(setq org-capture-templates
      '(("t" "TODO" entry (file+headline as/gtd "Collect")
         "* TODO %? \n  %U" :empty-lines 1)

        ("s" "TODO - Scheduled" entry (file+headline as/gtd "Collect")
         "* TODO %? \nSCHEDULED: %^t\n  %U" :empty-lines 1)

        ("d" "TODO - Deadline" entry (file+headline as/gtd "Collect")
         "* TODO %? \n  DEADLINE: %^t" :empty-lines 1)

        ("a" "Appointment" entry (file+headline as/gtd "Collect")
         "* %? \n  %^t")

        ("n" "Note" entry (file+headline as/gtd "Notes")
         "* %? \n%U" :empty-lines 1)

        ("j" "Journal" entry (file+datetree as/journal)
         "* %? \nEntered on %U\n")

      ;; Used with capture protocol Chrome extension
        ("p" "Protocol" entry (file+headline as/bookmarks "Collect")
         "* %^{Title}\nSource: %u, %c\n #+BEGIN_QUOTE\n%i\n#+END_QUOTE\n\n\n%?")
        ("L" "Protocol Link" entry (file+headline as/bookmarks "Inbox")
         "* %? [[%:link][%(transform-square-brackets-to-round-ones \"%:description\")]]\n")))

(setq org-agenda-files (directory-files-recursively as/org "\\.org$"))
(setq org-agenda-include-diary t)
(setq org-tag-persistent-alist '(("work" . ?w)
                                 ("buy" . ?b)
                                 ("sdm" . ??)
                                 ("X" . ?x)
                                 ("misc" . ?m)
                                 ("finance" . ?f)
                                 ("read" . ?r)
                                 ("school" . ?s)))

(setq org-agenda-sorting-strategy
      '(deadline-up todo-state-up timestamp-down priority-down))

(setq org-deadline-warning-days 14)
(setq org-columns-default-format "%60ITEM(Task) %10Effort(Estimation){:} %28SCHEDULED(Scheduled) %16DEADLINE(Deadline) %5CLOCKSUM(Clocked)")
(setq org-agenda-custom-commands
      `(("." . "Agenda + category")
        (".a" "Current agenda without habits" agenda ""
         ((org-agenda-span 14)
          (org-agenda-category-filter-preset '("-habit")))
         (,(concat as/agenda "agenda.ics")
          ,(concat as/agenda "agenda.html")))
        (".p" "PMI Agenda" agenda ""
         ((org-agenda-span 5)
          (org-agenda-category-filter-preset '("+PMI")))
         (,(concat as/org "PMI/PMI_Dev_Plan.html")))
        ("f" "Fluent Forever"
         ((tags-todo "category={FluentForever}"))
         ((org-agenda-overriding-header ""))
         (,(concat as/org "Fluent-Forever/Fluent-Forever.html")))
        ("h" "Habits" agenda "" ((org-agenda-category-filter-preset '("+habit"))))
        ("A" "All TODOs" ((alltodo))
         ((org-agenda-overriding-header "All TODOs")
          (org-agenda-sorting-strategy '(priority-down)))
         ,(concat as/agenda "all.html"))))

(setq org-export-with-toc nil
      org-export-with-section-numbers nil)
