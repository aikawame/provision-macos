all: install

install: prepare provision

prepare:
	@./etc/prepare.sh

provision:
	@./etc/provision.sh
