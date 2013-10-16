APPLICATIONS = 		\
	XMLIO.so		\
	LIST.so

top_srcdir = ../
LDNAME = xmlio

LDFILE = $(top_srcdir)/rec/$(LDNAME).ld
LINKREC = $(top_srcdir)/rec/link.rec
SPAREC = $(top_srcdir)/rec/spa.rec
SCRREC = $(top_srcdir)/rec/$(LDNAME).rec \
			$(top_srcdir)/rec/list.rec
COBOL_DEPENDENCIES = MCPAREA SPAAREA LINKAREA SCRAREA DB-WORK DB-PATH DB-XML
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

DB-XML: $(top_srcdir)/rec/xml.db
	@echo "copygen > $@"
	@copygen -dbrec -name "DB-XML" -prefix "DB-XML-" -ld $(LDNAME)	\
	    -dir $(top_srcdir)/directory xml > $@;				\
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
