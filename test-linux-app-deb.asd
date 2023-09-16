(defsystem "test-linux-app-deb"
  :version "0.1.0"
  :description "An application to test linux-packaging"
  :author "Alexander Artemenko <svetlyak.40wt@gmail.com>"
  :license "Unlicense"
  :homepage "https://github.com/svetlyak40wt/test-linux-app"
  :source-control (:git "https://github.com/svetlyak40wt/test-linux-app")
  :bug-tracker "https://github.com/svetlyak40wt/test-linux-app/issues"
  :class "linux-packaging:deb"
  :defsystem-depends-on ("linux-packaging")
  :depends-on ("test-linux-app")
  :build-operation "linux-packaging:build-op"
  :build-pathname "test-linux-app"
  :entry-point "test-linux-app/main::main")

