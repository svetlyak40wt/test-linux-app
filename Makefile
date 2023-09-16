all: test-linux-app

.qlot:
	qlot install

test-linux-app: .qlot *.asd src/*
	rm -fr *.deb test-linux-app
	SBCL_HOME=/home/art/.local/sbcl/lib/sbcl/ \
                ~/.local/sbcl/bin/sbcl \
		--eval '(require "asdf")' \
		--eval '(load "~/quicklisp/setup.lisp")' \
		--eval '(push "./" asdf:*central-registry*)' \
		--eval '(ql:quickload "test-linux-app-deb")' \
		--eval '(asdf:make "test-linux-app-deb")' \
		--quit

