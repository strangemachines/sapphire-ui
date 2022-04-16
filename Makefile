PATH := node_modules/.bin:$(PATH)
SHELL := /bin/bash


sass_path?=sass
dist_path?=dist


.PHONY: lint
lint:
	@sass-lint $(sass_path)/*.scss -v


.PHONY: build
build: lint
	@node_modules/.bin/sass --no-source-map $(sass_path)/all.scss $(dist_path)/main.css


.PHONY: dist
dist: build
	@node_modules/.bin/sass -s compressed $(sass_path)/all.scss $(dist_path)/main.min.css


.PHONY: clean
clean:
	@rm -rf $(dist_path)
