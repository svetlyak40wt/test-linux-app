#-asdf3.1 (error "test-linux-app requires ASDF 3.1 because for lower versions pathname does not work for package-inferred systems.")
(defsystem "test-linux-app"
  :version "0.1.0"
  :description "An application to test cl-linuxer"
  :author "Alexander Artemenko <svetlyak.40wt@gmail.com>"
  :license "Unlicense"
  :homepage "https://github.com/svetlyak40wt/test-linux-app"
  :source-control (:git "https://github.com/svetlyak40wt/test-linux-app")
  :bug-tracker "https://github.com/svetlyak40wt/test-linux-app/issues"
  :class :package-inferred-system
  :pathname "src"
  :depends-on ("test-linux-app/main")
  :in-order-to ((test-op (test-op "test-linux-app-tests"))))
