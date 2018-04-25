# Make sure to: pip install twine
# https://github.com/pypa/twine

PACKAGE=edw.seleniumtesting

VERSION=$(shell grep "VERSION = " setup.py | grep -o '[0-9.]*')

all:

build:
	python setup.py bdist_wheel
	python setup.py bdist_egg

release: build
	twine upload ./dist/${PACKAGE}-${VERSION}-*.whl
	twine upload ./dist/${PACKAGE}-${VERSION}-*.egg

clean:
	rm -rf build/ dist/

