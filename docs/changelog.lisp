(uiop:define-package #:test-linux-app-docs/changelog
  (:use #:cl)
  (:import-from #:40ants-doc/changelog
                #:defchangelog))
(in-package #:test-linux-app-docs/changelog)


(defchangelog (:ignore-words ("SLY"
                              "ASDF"
                              "REPL"
                              "HTTP"))
    (0.1.0 2023-09-16
           "* Initial version."))
