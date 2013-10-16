APPLICATIONS = 		\
	SYSDB.so

top_srcdir = ../
LDNAME = sysdb

LDFILE = $(top_srcdir)/rec/$(LDNAME).ld
LINKREC = $(top_srcdir)/rec/link.rec
SPAREC = $(top_srcdir)/rec/spa.rec
SCRREC = $(top_srcdir)/rec/$(LDNAME).rec
COBOL_DEPENDENCIES = MCPAREA SPAAREA LINKAREA SCRAREA DB-PATH DB-SYSTEM
CLEAN_FILES = $(COBOL_DEPENDENCIES)

include $(top_srcdir)/cobol/Makefile.common

DB-SYSTEM: $(top_srcdir)/rec/system.db
	@echo "copygen > $@"
	@copygen -dbrec -name "DB-SYSTEM" -prefix "DB-SYSTEM-" -ld $(LDNAME)	\
	    -dir $(top_srcdir)/directory system > $@;				\
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
