(uiop:define-package #:test-linux-app/main
  (:use #:cl
        ;; #:cl-ncurses
        )
  (:import-from #:cl-repl
                #:main)
  (:import-from #:osicat)
  ;; (:import-from #:cl-ncurses)
  (:import-from #:cl-ppcre)
  (:import-from #:linux-packaging))
(in-package #:test-linux-app/main)


(defmethod LINUX-PACKAGING/PACKAGE:PATH->PACKAGE ((package linux-packaging:deb) path)
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


;; cl-ncurses is unable to find proper library on Ubuntu 22.04,
;; that is why we need to reload the library manually
;; (push "/usr/lib/x86_64-linux-gnu/" cl-ncurses::*ncurses-search-paths*)
;; (push "/lib/x86_64-linux-gnu/" cl-ncurses::*ncurses-search-paths*)

;; (setf cl-ncurses::*ncurses-path*
;;       (uffi:find-foreign-library
;;        "libncurses"
;;        cl-ncurses::*ncurses-search-paths*
;;        :types '("so.6")))


;; (cond
;;   (cl-ncurses::*ncurses-path*
;;    (format t "~&;;; Loading ~s" cl-ncurses::*ncurses-path*)
;;    (uffi:load-foreign-library cl-ncurses::*ncurses-path*
;;                               :module "cl-ncurses"))
;;   (t
;;    (warn "Unable to load ncurses.")))


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


;; (defun main ()
;;   "This example is based on:
;;    https://www.tldp.org/HOWTO/NCURSES-Programming-HOWTO/windows.html"
;;   (initscr)
;;   (start-color)
;;   (init-pair 1
;;              color_red
;;              color_black)

;;   (let ((text "Hello Lisp World!"))
;;     (multiple-value-bind (screen-height screen-width)
;;         (get-maxyx *stdscr*)
;;       (let* ((text-len (length text))
;;              (box-width (+ text-len 4))
;;              (box-height 5)
;;              (box-x (round (/ (- screen-width box-width)
;;                               2)))
;;              (box-y (round (/ (- screen-height box-height)
;;                               2)))
;;              (plus (char-code #\+))
;;              (h-line (char-code #\-))
;;              (v-line (char-code #\|)))

;;         (attron (color-pair 1))

;;         ;; It's time to print a text in the center of the screen:
;;         (mvprintw (+ box-y 2) (+ box-x 2) text)
        
;;         ;; Now we'll draw a border around the box.
;;         ;; Horizontal lines:
;;         (mvhline box-y box-x
;;                  h-line box-width)
;;         (mvhline (+ box-y (1- box-height)) box-x
;;                  h-line box-width)
;;         ;; Vertical lines:
;;         (mvvline box-y box-x
;;                  v-line box-height)
;;         (mvvline box-y (+ box-x (1- box-width))
;;                  v-line box-height)
;;         ;; And corners
;;         (mvaddch box-y box-x
;;                  plus)
;;         (mvaddch box-y (+ box-x (1- box-width))
;;                  plus)
;;         (mvaddch (+ box-y (1- box-height))
;;                  (+ box-x (1- box-width))
;;                  plus)
;;         (mvaddch (+ box-y (1- box-height)) box-x
;;                  plus)
;;         (move 0 0))))

;;   ;; Wait for key press
;;   (getch)
;;   (endwin))
