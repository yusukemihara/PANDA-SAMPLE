APPLICATIONS = 		\
	PRINT.so	\
	SCREEN1.so \
	SCREEN2.so

top_srcdir = ../
LDNAME = print

LDFILE = $(top_srcdir)/rec/$(LDNAME).ld
LINKREC = $(top_srcdir)/rec/link.rec
SPAREC = $(top_srcdir)/rec/$(LDNAME)_spa.rec
SCRREC = $(top_srcdir)/rec/$(LDNAME).rec
COBOL_DEPENDENCIES = MCPAREA SPAAREA LINKAREA SCRAREA DB-WORK DB-PATH
CLEAN_FILES = $(COBOL_DEPENDENCIES)

include $(top_srcdir)/cobol/Makefile.common

DB-WORK: $(top_srcdir)/rec/work.db
	@echo "copygen > $@"
	@copygen -dbrec -name "DB-WORK" -prefix "DB-WORK-" -ld $(LDNAME)	\
	    -dir $(top_srcdir)/directory work > $@;				\
	if [ $$? != 0 ]; then							\
	    rm -f $@;								\
	    exit 1;								\
	fi

DB-PATH: $(top_srcdir)/directory
	@echo "copygen > $@"
	@copygen -dbpath -ld $(LDNAME) -dir $(top_srcdir)/directory > $@;	\
	if [ $$? != 0 ]; then							\
	    rm -f $@;								\
	    exit 1;								\
	fi
