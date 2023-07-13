all: bin/test-brew-app

.qlot:
	qlot install

#  --eval '(push :deploy-console *features*)'
bin/test-brew-app: .qlot *.asd src/*
	qlot exec ros run --eval '(require "asdf")' --eval '(ql:quickload "deploy")' --eval '(ql:quickload "test-brew-app")' --eval '(asdf:make "test-brew-app")' --quit
