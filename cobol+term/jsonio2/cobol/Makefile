APPLICATIONS = 		\
	JSONIO.so

top_srcdir = ../
LDNAME = jsonio

LDFILE = $(top_srcdir)/rec/$(LDNAME).ld
LINKREC = $(top_srcdir)/rec/link.rec
SPAREC = $(top_srcdir)/rec/spa.rec
SCRREC = $(top_srcdir)/rec/$(LDNAME).rec
COBOL_DEPENDENCIES = MCPAREA SPAAREA LINKAREA SCRAREA DB-BLOB DB-JSON
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

DB-JSON: $(top_srcdir)/rec/json.db
	@echo "copygen > $@"
	@copygen -dbrec -name "DB-JSON" -prefix "DB-JSON-" -ld $(LDNAME)	\
	    -dir $(top_srcdir)/directory json > $@;				\
	if [ $$? != 0 ]; then							\
	    rm -f $@;								\
	    exit 1;								\
	fi
