(defsystem "test-brew-app-docs"
  :author "Alexander Artemenko <svetlyak.40wt@gmail.com>"
  :license "Unlicense"
  :class :package-inferred-system
  :description "Provides documentation for test-brew-app."
  :source-control (:git "https://github.com/svetlyak40wt/test-brew-app")
  :bug-tracker "https://github.com/svetlyak40wt/test-brew-app/issues"
  :pathname "docs"
  :depends-on ("test-brew-app"
               "test-brew-app-docs/index"))
