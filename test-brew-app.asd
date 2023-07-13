#-asdf3.1 (error "test-brew-app requires ASDF 3.1 because for lower versions pathname does not work for package-inferred systems.")
(defsystem "test-brew-app"
  :description "An application to test cl-brewer"
  :author "Alexander Artemenko <svetlyak.40wt@gmail.com>"
  :license "Unlicense"
  :homepage "https://github.com/svetlyak40wt/test-brew-app"
  :source-control (:git "https://github.com/svetlyak40wt/test-brew-app")
  :bug-tracker "https://github.com/svetlyak40wt/test-brew-app/issues"
  :class :40ants-asdf-system
  :defsystem-depends-on ("40ants-asdf-system"
                         "deploy")
  :pathname "src"
  :depends-on ("cl-plus-ssl-osx-fix"
               "test-brew-app/main")

  :defsystem-depends-on (:deploy)
  :build-operation "deploy-op"
  :build-pathname "test-brew-app"
  :entry-point "test-brew-app/main::main"

  :in-order-to ((test-op (test-op "test-brew-app-tests"))))


(deploy:define-hook (:deploy ignore-system-libraries) ()
  (loop for lib in (deploy:list-libraries)
        when (eql (cffi:foreign-library-type lib)
                  :system)
          do (setf (deploy:library-dont-deploy-p lib)
                   t)
          and collect (or (deploy:library-path lib)
                          (deploy:library-name lib)) into ignored-libs
        finally (when ignored-libs
                  (deploy:status 1 "Ignoring these system libraries:")
                  (loop for lib in ignored-libs
                        do (deploy:status 2 "~A" lib)))))


(defvar *libexec-path*
  (uiop:getenv "LIBEXEC_PATH"))


(deploy:define-hook (:boot restore-path-to-libexec
                     ;; we need to ensure this hook will be executed before
                     ;; Deploy's attempt to load libraries:
                     (1+ most-positive-fixnum)) ()
  (when *libexec-path*
    (deploy:status 0 "Adding ~A to cffi:*foreign-library-directories*.")
    (push *libexec-path*
          cffi:*foreign-library-directories*)))
