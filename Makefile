PREFIX ?= /usr/local

STRIP ?= strip

INSTALL = ./tools/install.sh
INST_BIN = $(INSTALL) -Dm0755
INST_DOC = $(INSTALL) -Dm0644

all: mlibtool

clean:
	rm -f mlibtool

install: mlibtool
	$(INST_BIN) mlibtool $(DESTDIR)$(PREFIX)/bin/mlibtool
	$(INST_BIN) acmlibtool $(DESTDIR)$(PREFIX)/bin/acmlibtool
	$(INST_BIN) nomlibtool.sh $(DESTDIR)$(PREFIX)/bin/nomlibtool.sh
	$(INST_DOC) README.md $(DESTDIR)$(PREFIX)/share/mlibtool/README
	$(INST_DOC) mlibtool.m4 $(DESTDIR)$(PREFIX)/share/mlibtool/mlibtool.m4

install-strip: install
	$(STRIP) -s -R .note -R .comment $(DESTDIR)$(PREFIX)/bin/mlibtool

.PHONY: all clean install install-strip install-doc
