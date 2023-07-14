(uiop:define-package #:test-brew-app-docs/changelog
  (:use #:cl)
  (:import-from #:40ants-doc/changelog
                #:defchangelog))
(in-package #:test-brew-app-docs/changelog)


(defchangelog (:ignore-words ("SLY"
                              "ASDF"
                              "REPL"
                              "HTTP"))
  (0.2.0 2023-07-15
         "* Updated."
   )
  (0.1.0 2023-02-05
         "* Initial version."))
