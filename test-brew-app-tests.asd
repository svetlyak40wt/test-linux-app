(defsystem "test-brew-app-tests"
  :author "Alexander Artemenko <svetlyak.40wt@gmail.com>"
  :license "Unlicense"
  :class :package-inferred-system
  :description "Provides tests for test-brew-app."
  :source-control (:git "https://github.com/svetlyak40wt/test-brew-app")
  :bug-tracker "https://github.com/svetlyak40wt/test-brew-app/issues"
  :pathname "t"
  :depends-on ("test-brew-app-tests/core")
  :perform (test-op (op c)
                    (unless (symbol-call :rove :run c)
                      (error "Tests failed"))))
