SHELL = /bin/bash

MAINFILE = main.pdf
LYOUT_DIR = lyout

.PHONY: build clean clobber

build : $(LYOUT_DIR)
	cp *.gabc Makefile $(LYOUT_DIR)
	$(MAKE) -C $(LYOUT_DIR) $(MAINFILE)
	cp $(LYOUT_DIR)/$(MAINFILE) $(MAINFILE)

clean :
	rm -rf $(LYOUT_DIR)

clobber : clean
	rm -f $(MAINFILE)

$(LYOUT_DIR) : $(MAINFILE:.pdf=.lytex)
	lilypond-book --output=$(LYOUT_DIR) $<

%.pdf : %.tex
	lualatex --shell-escape $<
	lualatex --shell-escape $<
