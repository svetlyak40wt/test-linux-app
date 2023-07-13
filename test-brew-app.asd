#-asdf3.1 (error "test-brew-app requires ASDF 3.1 because for lower versions pathname does not work for package-inferred systems.")
(defsystem "test-brew-app"
  :description "An application to test cl-brewer"
  :author "Alexander Artemenko <svetlyak.40wt@gmail.com>"
  :license "Unlicense"
  :source-control (:git "https://github.com/svetlyak40wt/test-brew-app")
  :bug-tracker "https://github.com/svetlyak40wt/test-brew-app/issues"
  :class :40ants-asdf-system
  :defsystem-depends-on ("40ants-asdf-system")
  :pathname "src"
  :depends-on ("cl-plus-ssl-osx-fix"
               "test-brew-app/main")

  :defsystem-depends-on (:deploy)
  :build-operation "deploy-op"
  :build-pathname "test-brew-app"
  :entry-point "test-brew-app/main::main"

  :in-order-to ((test-op (test-op "test-brew-app-tests"))))


(deploy:define-hook (:deploy foreign-libraries) (directory)
  (format t "Librarires to copy: ~S~%"
          (loop for lib in (deploy:list-libraries)
                when (eql (cffi:foreign-library-type lib)
                          :system)
                  do (setf (deploy:library-dont-deploy-p lib)
                           t))))
