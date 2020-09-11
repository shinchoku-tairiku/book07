SATYSFI:=./scripts/run-docker.sh
PDFTOOLS:=./scripts/run-pdf-tools.sh

.PHONY: book
book: build
	$(PDFTOOLS) pdftk A=cover.pdf B=main.pdf cat A B output book.pdf
	$(PDFTOOLS) exiftool -Title='進捗大陸07' -Author='@yutopp, @amutake, @pockerberserker, @youxkei' -Producer='SATySFi' -Creator='SATySFi' -overwrite_original book.pdf

.PHONY: build
build: .satysfi/dist/fonts
	$(SATYSFI) src/main.saty -o main.pdf

.satysfi/dist/fonts:
	./scripts/install-fonts.sh fonts.txt .satysfi

.PHONY: clean-fonts
clean-fonts:
	rm -rf .satysfi/dist/fonts/
