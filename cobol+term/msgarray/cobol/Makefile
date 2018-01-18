APPLICATIONS = 	\
	TEST1.so	\
	TEST2.so

top_srcdir = ../
LDNAME = test1

LDFILE = $(top_srcdir)/$(LDNAME).ld
LINKREC = $(top_srcdir)/link.rec
SPAREC = $(top_srcdir)/spa.rec
SCRREC = $(top_srcdir)/test1.rec
#COBOL_DEPENDENCIES = MCPAREA SPAAREA LINKAREA SCRAREA DB-BLOB DB-MSG
COBOL_DEPENDENCIES = MCPAREA SPAAREA LINKAREA DB-BLOB DB-MSG
CLEAN_FILES = $(COBOL_DEPENDENCIES)

include $(top_srcdir)/cobol/Makefile.common

DB-BLOB: $(top_srcdir)/blob.db
	@echo "copygen > $@"
	@copygen -dbrec -name "DB-BLOB" -prefix "DB-BLOB-" -ld $(LDNAME)	\
	    -dir $(top_srcdir)/directory blob > $@;				\
	if [ $$? != 0 ]; then							\
	    rm -f $@;								\
	    exit 1;								\
	fi

DB-MSG: $(top_srcdir)/msg1.db
	@echo "copygen > $@"
	@copygen -dbrec -name "DB-MSG" -prefix "DB-MSG-" -ld $(LDNAME)	\
	    -dir $(top_srcdir)/directory msg1 > $@;				\
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
