.PHONY : develop build clean clean_pyc doc lint-diff black

all: develop

clean_pyc:
	-find . -name '*.py[co]' -exec rm {} \;

build: clean_pyc
	poetry build

lint-diff:
	git diff upstream/master --name-only -- "*.py" | xargs flake8

black:
	black .

develop: build
	poetry install

