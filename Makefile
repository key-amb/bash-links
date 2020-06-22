.PHONY: doc release shove

BIN     := ./links
VERSION := $(shell $(BIN) -v)

README.md: $(BIN)
	@if ! command -v pod2markdown >/dev/null 2>&1; then \
		echo "[ERROR] pod2markdown not installed!" >&2; \
		exit 1; \
	fi
	pod2markdown $(BIN) > README.md

doc: README.md

test: shove
	@set -e; \
	vendor/shove/bin/shove -r t -v

release: README.md
	git commit -m $(VERSION)
	test $$(git status --short | wc -l) -eq 0
	git tag -a v$(VERSION) -m $(VERSION)
	git push origin v$(VERSION)
	git push origin master

shove: vendor
	@echo checkout or update vendor/shove
	@if [ -d vendor/shove ]; then \
		cd vendor/shove && git pull origin master; \
	else \
		git clone --depth=1 https://github.com/progrhyme/shove.git vendor/shove; \
	fi

vendor:
	mkdir vendor
