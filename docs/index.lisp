(uiop:define-package #:test-linux-app-docs/index
  (:use #:cl)
  (:import-from #:pythonic-string-reader
                #:pythonic-string-syntax)
  #+quicklisp
  (:import-from #:quicklisp)
  (:import-from #:named-readtables
                #:in-readtable)
  (:import-from #:40ants-doc
                #:defsection
                #:defsection-copy)
  (:import-from #:test-linux-app-docs/changelog
                #:@changelog)
  (:import-from #:docs-config
                #:docs-config)
  (:export #:@index
           #:@readme
           #:@changelog))
(in-package #:test-linux-app-docs/index)

(in-readtable pythonic-string-syntax)


(defmethod docs-config ((system (eql (asdf:find-system "test-linux-app-docs"))))
  ;; 40ANTS-DOC-THEME-40ANTS system will bring
  ;; as dependency a full 40ANTS-DOC but we don't want
  ;; unnecessary dependencies here:
  #+quicklisp
  (ql:quickload "40ants-doc-theme-40ants")
  #-quicklisp
  (asdf:load-system "40ants-doc-theme-40ants")
  
  (list :theme
        (find-symbol "40ANTS-THEME"
                     (find-package "40ANTS-DOC-THEME-40ANTS")))
  )


(defsection @index (:title "test-linux-app - An application to test cl-linuxer"
                    :ignore-words ("JSON"
                                   "HTTP"
                                   "TODO"
                                   "Unlicense"
                                   "REPL"
                                   "ASDF:PACKAGE-INFERRED-SYSTEM"
                                   "ASDF"
                                   "40A"
                                   "API"
                                   "URL"
                                   "RPM"
                                   "URI"
                                   "RPC"
                                   "GIT"))
  (test-linux-app system)
  "
[![](https://github-actions.40ants.com/svetlyak40wt/test-linux-app/matrix.svg?only=ci.run-tests)](https://github.com/svetlyak40wt/test-linux-app/actions)

![Quicklisp](http://quickdocs.org/badge/test-linux-app.svg)
"
  (@usage section))


(defsection-copy @readme @index)


(defsection @usage (:title "Usage")
  "
This repository contains a demo application showing how to build debian package for Common Lisp application. It was created as part of this video: https://www.youtube.com/watch?v=lGS4sr6AzKw about [linux-packaging](https://gitlab.com/ralt/linux-packaging) ASDF system.

To build a deb package you need SBCL built with with enabled static compilation feature and fpm (requirement of linux-packaging).

Change paths to SBCL in the Makefile and run `make` command. It should produce the test-linux-app-deb-0.1.0.deb package which can be installed
with `apt-get` or `apt`.

The same way you may try to build RPM package on Centos. See full list of supported linuxes on the home page of the linux-packaging ASDF system.
")

