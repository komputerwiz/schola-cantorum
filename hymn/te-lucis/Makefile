SHELL = /bin/bash

MAINFILE = te-lucis.pdf

.PHONY: build clean clobber

build : $(MAINFILE)

clean :
	rm -f *.glog *.gtex *.aux *.gaux *.log */*.glog */*.gtex */*.aux */*.gaux */*.log

clobber : clean
	rm -f $(MAINFILE)

%.pdf : %.tex
	lualatex --shell-escape $<
	lualatex --shell-escape $<
