SHELL := /usr/bin/env bash

EMACS ?= emacs
EASK ?= eask

.PHONY: clean checkdoc lint package install compile test

ci: clean package install compile

package:
	@echo "Packaging..."
	$(EASK) package

install:
	@echo "Installing..."
	$(EASK) install

compile:
	@echo "Compiling..."
	$(EASK) compile

test:
	@echo "Testing..."
	$(EASK) exec ert-runner -L . $(LOAD-TEST-FILES) -t '!no-win' -t '!org'

clean:
	$(EASK) clean-all

activate:
	$(EASK) install
	$(EASK) load ./test/activate.el
