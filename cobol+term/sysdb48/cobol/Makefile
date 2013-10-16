APPLICATIONS = 		\
	WINDOW1.so	\

top_srcdir = ../
LDNAME = sysdb48

LDFILE = $(top_srcdir)/rec/$(LDNAME).ld
LINKREC = $(top_srcdir)/rec/link.rec
SPAREC = $(top_srcdir)/rec/spa.rec
SCRREC = $(top_srcdir)/rec/window1.rec
COBOL_DEPENDENCIES = MCPAREA SPAAREA LINKAREA DB-SYS
CLEAN_FILES = $(COBOL_DEPENDENCIES)

include $(top_srcdir)/cobol/Makefile.common


DB-SYS: $(top_srcdir)/rec/system.db
	@echo "copygen > $@"
	@copygen -dbrec -name "DB-SYS" -prefix "DB-SYS-" -ld $(LDNAME)	\
	    -dir $(top_srcdir)/directory system > $@;				\
	if [ $$? != 0 ]; then							\
	    rm -f $@;								\
	    exit 1;								\
	fi
