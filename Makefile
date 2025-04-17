.PHONY: install uninstall docker-pull

install:
	./scripts/install.bash

uninstall:
	./scripts/uninstall.bash

docker-pull:
	/usr/bin/docker pull gogs/gogs:latest
