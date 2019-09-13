path = Users/bcooley/Dropbox/8_Templates/

all: introduction.pdf

introduction.pdf: introduction.rmd
	pandoc --template=/$(path)$/cooley-plain.latex \
	--filter pandoc-citeproc \
	-o introduction.pdf introduction.rmd