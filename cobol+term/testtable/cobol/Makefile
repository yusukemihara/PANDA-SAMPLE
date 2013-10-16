APPLICATIONS = 		\
	WINDOW1.so	\
	WINDOW2.so	\

top_srcdir = ../
LDNAME = test1

LDFILE = $(top_srcdir)/rec/$(LDNAME).ld
LINKREC = $(top_srcdir)/rec/link.rec
SPAREC = $(top_srcdir)/rec/spa1.rec
SCRREC = $(top_srcdir)/rec/window1.rec
COBOL_DEPENDENCIES = MCPAREA SPAAREA LINKAREA SCRAREA
CLEAN_FILES = $(COBOL_DEPENDENCIES)

include $(top_srcdir)/cobol/Makefile.common
