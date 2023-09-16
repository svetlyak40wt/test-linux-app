(defsystem "test-linux-app-docs"
  :author "Alexander Artemenko <svetlyak.40wt@gmail.com>"
  :license "Unlicense"
  :class :package-inferred-system
  :description "Provides documentation for test-linux-app."
  :source-control (:git "https://github.com/svetlyak40wt/test-linux-app")
  :bug-tracker "https://github.com/svetlyak40wt/test-linux-app/issues"
  :pathname "docs"
  :depends-on ("test-linux-app"
               "test-linux-app-docs/index"))
