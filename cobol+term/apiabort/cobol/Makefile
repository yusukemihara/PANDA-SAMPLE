APPLICATIONS = 		\
	API1.so	\
	API2.so

top_srcdir = ../
LDNAME = testld

LDFILE = $(top_srcdir)/rec/$(LDNAME).ld
LINKREC = $(top_srcdir)/rec/link.rec
SPAREC = $(top_srcdir)/rec/spa.rec
SCRREC = $(top_srcdir)/rec/api1.rec
COBOL_DEPENDENCIES = MCPAREA SPAAREA LINKAREA SCRAREA DB-BLOB DB-MSG
CLEAN_FILES = $(COBOL_DEPENDENCIES)

include $(top_srcdir)/cobol/Makefile.common

DB-BLOB: $(top_srcdir)/rec/blob.db
	@echo "copygen > $@"
	@copygen -dbrec -name "DB-BLOB" -prefix "DB-BLOB-" -ld $(LDNAME)	\
	    -dir $(top_srcdir)/directory blob > $@;				\
	if [ $$? != 0 ]; then							\
	    rm -f $@;								\
	    exit 1;								\
	fi

DB-MSG: $(top_srcdir)/rec/msg.db
	@echo "copygen > $@"
	@copygen -dbrec -name "DB-MSG" -prefix "DB-MSG-" -ld $(LDNAME)	\
	    -dir $(top_srcdir)/directory msg > $@;				\
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
