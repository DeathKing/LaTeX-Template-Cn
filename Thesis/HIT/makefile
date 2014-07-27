part:
	latex main.tex
	dvipdfmx main.dvi
all:
	latex main.tex
	bibtex main
	latex main
	latex main
	dvipdfmx main.dvi
clean:
	-find -name '*.aux' -exec rm {} \;
	-find -name '*.bak' -exec rm {} \;
	-find -name '*.dvi' -exec rm {} \;
	-find -name '*~' -exec rm {} \;
	-rm *.bbl *.blg *.log *.out *.pdf *.ps *.thm *.toc *.toe
	-rm ppt/ppt.log ppt/ppt.nav ppt/ppt.out ppt/ppt.pdf ppt/ppt.snm ppt/ppt.toc


