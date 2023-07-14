(uiop:define-package #:test-brew-app/main
  (:use #:cl)
  ;; (:import-from #:osicat)
  )
(in-package #:test-brew-app/main)


(defun main ()
  (format t "Hello world!~%")
  ;; (format t "My pid is: ~A~%"
  ;;         (osicat-posix:getpid))
  ;; (format t "Here are all env vars:~%")
  ;; (loop for (key . value) in (sort (osicat:environment)
  ;;                                  #'string<
  ;;                                  :key #'car)
  ;;       do (format t "~A = ~A~%"
  ;;                  key value))
  )
