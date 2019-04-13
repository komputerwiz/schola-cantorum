SHELL = /bin/bash

MAINFILE = tenebrae.pdf

.PHONY: build clean clobber

build : $(MAINFILE)

clean :
	rm -f *.glog *.gtex *.aux *.gaux *.log

clobber : clean
	rm -f $(MAINFILE)

%.pdf : %.tex
	lualatex --shell-escape $<
	lualatex --shell-escape $<
