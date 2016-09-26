.PHONY: doc release

BIN     := ./links
VERSION := $(shell $(BIN) -v)

README.md: $(BIN)
	@if ! command -v pod2markdown >/dev/null 2>&1; then \
		echo "[ERROR] pod2markdown not installed!" >&2; \
		exit 1; \
	fi
	pod2markdown $(BIN) > README.md

doc: README.md

release: README.md
	git commit -m $(VERSION)
	git tag -a v$(VERSION) -m $(VERSION)
	git push origin v$(VERSION)
	git push origin master
