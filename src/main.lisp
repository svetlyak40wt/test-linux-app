(uiop:define-package #:test-linux-app/main
  (:use #:cl)
  (:import-from #:cl-repl
                #:main)
  (:import-from #:osicat)
  (:import-from #:cl-ppcre)
  (:import-from #:linux-packaging))
(in-package #:test-linux-app/main)


(defmethod linux-packaging/package:path->package
    ((package linux-packaging:deb) path)
  ;; On some Linux systems package manager makes hard links
  ;; from /lib/x86_64-linux-gnu/ to /usr/lib/x86_64-linux-gnu/ and
  ;; CFFI returns a pathname of the link instead of original file.
  ;; When this happen, dpkg -S is unable to find package by a full path.
  ;; Thus here were are searching package by a filename only.
  (let* ((real-path (uiop:truenamize path))
         (only-name (make-pathname :name (pathname-name real-path)
                                   :type (pathname-type real-path)))
         (path-as-string
           (namestring only-name))
         (package-name
           (first (cl-ppcre:split
                   ":"
                   (uiop:run-program (list "dpkg" "-S" path-as-string)
                                     :output '(:string :stripped t))))))
    (values package-name)))



;; Simple app using OSICAT
;; (defun main ()
;;   (format t "Hello world!~%")
;;   (format t "My pid is: ~A~%"
;;           (osicat-posix:getpid))
;;   (format t "Here are all env vars:~%")
;;   (loop for (key . value) in (sort (osicat:environment)
;;                                    #'string<
;;                                    :key #'car)
;;         do (format t "~A = ~A~%"
;;                    key value)))
