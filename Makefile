.PHONY:  all build edit log viewpdf viewps silent make pdf emacs-x dvi emacs e ex html
NAME=main
FILE ?= ${NAME}.tex

all:	build
build:	$(NAME).tex setdate
	pslatex ${NAME}.tex
#	dvips ${NAME}.dvi
	pdflatex ${NAME}.tex
edit:
	mcedit  ${FILE}
emacs-x:
	emacs ${FILE} &
emacs:
	@emacs -nw ${FILE}
e: emacs
ex: emacs-x
log:
	@mcview ${NAME}.log
viewpdf:
	@acroread $(NAME).pdf
viewps:
	@gv $(NAME).ps
silent:	$(NAME).tex setdate
	@pdflatex ${NAME}.tex >/dev/null 2>&1
dvi:
	@pslatex ${NAME}.tex >/dev/null 2>&1
make:
	mcedit Makefile
pdf: silent viewpdf

setdate:
	@bash mkdate.sh


html:
	@html/reparse
