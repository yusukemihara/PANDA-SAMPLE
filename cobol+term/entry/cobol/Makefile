APPLICATIONS = 		\
	ENTRYTEST.so

top_srcdir = ../
LDNAME = entrytest

LDFILE = $(top_srcdir)/rec/$(LDNAME).ld
LINKREC = $(top_srcdir)/rec/link.rec
SPAREC = $(top_srcdir)/rec/spa.rec
SCRREC = $(top_srcdir)/rec/entrytest.rec
COBOL_DEPENDENCIES = MCPAREA SPAAREA LINKAREA SCRAREA
CLEAN_FILES = $(COBOL_DEPENDENCIES)

include $(top_srcdir)/cobol/Makefile.common
