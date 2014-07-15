APPLICATIONS = 		\
	WINDOW1.so

top_srcdir = ../
LDNAME = monupload

LDFILE = $(top_srcdir)/rec/$(LDNAME).ld
LINKREC = $(top_srcdir)/rec/link.rec
SPAREC = $(top_srcdir)/rec/spa.rec
SCRREC = $(top_srcdir)/rec/window1.rec
COBOL_DEPENDENCIES = MCPAREA SPAAREA LINKAREA SCRAREA DB-SHELL
CLEAN_FILES = $(COBOL_DEPENDENCIES)

DB-SHELL: $(top_srcdir)/rec/shell.db
	@echo "copygen > $@"
	@copygen -dbrec -name "DB-SHELL" -prefix "DB-SHELL-" -ld $(LDNAME)	\
	    -dir $(top_srcdir)/directory shell > $@;				\
	if [ $$? != 0 ]; then							\
	    rm -f $@;								\
	    exit 1;								\
	fi

include $(top_srcdir)/cobol/Makefile.common
