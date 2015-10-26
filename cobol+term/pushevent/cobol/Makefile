APPLICATIONS = 		\
	WINDOW1.so

top_srcdir = ../
LDNAME = test1

LDFILE = $(top_srcdir)/rec/$(LDNAME).ld
LINKREC = $(top_srcdir)/rec/link.rec
SPAREC = $(top_srcdir)/rec/spa.rec
SCRREC = $(top_srcdir)/rec/window1.rec
COBOL_DEPENDENCIES = MCPAREA SPAAREA LINKAREA SCRAREA DB-PUSH
CLEAN_FILES = $(COBOL_DEPENDENCIES)

include $(top_srcdir)/cobol/Makefile.common

DB-PUSH: $(top_srcdir)/rec/push.db
	@echo "copygen > $@"
	@copygen -dbrec -name "DB-PUSH" -prefix "DB-PUSH-" -ld $(LDNAME)	\
	    -dir $(top_srcdir)/directory push > $@;				\
	if [ $$? != 0 ]; then							\
	    rm -f $@;								\
	    exit 1;								\
	fi
