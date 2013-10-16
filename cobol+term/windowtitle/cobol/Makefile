APPLICATIONS = 		\
	ACTION01.so		\
	ACTION02.so		\
	POST.so			\
	WINDOWTITLE.so

top_srcdir = ..
LDNAME = windowtitle

LDFILE = $(top_srcdir)/rec/$(LDNAME).ld
LINKREC = $(top_srcdir)/rec/link.rec
SPAREC = $(top_srcdir)/rec/$(LDNAME)_spa.rec
SCRREC = 	$(top_srcdir)/rec/$(LDNAME).rec	\
			$(top_srcdir)/rec/action01.rec	\
			$(top_srcdir)/rec/action02.rec	\
			$(top_srcdir)/rec/post.rec
COBOL_DEPENDENCIES = MCPAREA SPAAREA LINKAREA SCRAREA
CLEAN_FILES = $(COBOL_DEPENDENCIES)

include $(top_srcdir)/cobol/Makefile.common
