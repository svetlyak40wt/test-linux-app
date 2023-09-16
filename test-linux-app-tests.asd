(defsystem "test-linux-app-tests"
  :author "Alexander Artemenko <svetlyak.40wt@gmail.com>"
  :license "Unlicense"
  :class :package-inferred-system
  :description "Provides tests for test-linux-app."
  :source-control (:git "https://github.com/svetlyak40wt/test-linux-app")
  :bug-tracker "https://github.com/svetlyak40wt/test-linux-app/issues"
  :pathname "t"
  :depends-on ("test-linux-app-tests/core")
  :perform (test-op (op c)
                    (unless (symbol-call :rove :run c)
                      (error "Tests failed"))))
