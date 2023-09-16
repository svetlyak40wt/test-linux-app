(defsystem "test-linux-app-ci"
  :author "Alexander Artemenko <svetlyak.40wt@gmail.com>"
  :license "Unlicense"
  :class :package-inferred-system
  :description "Provides CI settings for test-linux-app."
  :source-control (:git "https://github.com/svetlyak40wt/test-linux-app")
  :bug-tracker "https://github.com/svetlyak40wt/test-linux-app/issues"
  :pathname "src"
  :depends-on ("40ants-ci"
               "test-linux-app-ci/ci"))
