SATYSFI:=./scripts/run-docker.sh

.PHONY: build
build: .satysfi/dist/fonts
	$(SATYSFI) src/main.saty -o main.pdf

.satysfi/dist/fonts:
	./scripts/install-fonts.sh fonts.txt .satysfi

.PHONT: clean-fonts
clean-fonts:
	rm -rf .satysfi/dist/fonts/
