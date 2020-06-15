SATYSFI:=./scripts/run-docker.sh

.PHONY: build
build: .satysfi/dist/fonts
	$(SATYSFI) src/main.saty -o main.pdf

.satysfi/dist/fonts:
	./install-fonts.sh
