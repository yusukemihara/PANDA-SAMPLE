APPLICATIONS = 		\
	WINDOW1.so	\

top_srcdir = ../
LDNAME = filechooser

LDFILE = $(top_srcdir)/rec/$(LDNAME).ld
LINKREC = $(top_srcdir)/rec/link.rec
SPAREC = $(top_srcdir)/rec/spa.rec
SCRREC = $(top_srcdir)/rec/window1.rec
COBOL_DEPENDENCIES = MCPAREA SPAAREA LINKAREA SCRAREA DB-WORK
CLEAN_FILES = $(COBOL_DEPENDENCIES) *.dat

include $(top_srcdir)/cobol/Makefile.common

DB-WORK: $(top_srcdir)/rec/work.db
	@echo "copygen > $@"
	@copygen -dbrec -name "DB-WORK" -prefix "DB-WORK-" -ld $(LDNAME)	\
	    -dir $(top_srcdir)/directory work > $@;				\
	if [ $$? != 0 ]; then							\
	    rm -f $@;								\
	    exit 1;								\
	fi
