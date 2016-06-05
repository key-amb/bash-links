.PHONY: doc release

BIN     := ./links
VERSION := $(shell $(BIN) -v)

README.md: $(BIN)
	pod2markdown $(BIN) > README.md

doc: README.md

release: README.md
	git commit -m $(VERSION)
	git tag -a v$(VERSION) -m $(VERSION)
	git push origin v$(VERSION)
	git push origin master
