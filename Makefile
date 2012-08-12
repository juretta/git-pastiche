PREFIX ?= /usr/local
MANPREFIX ?= "$(PREFIX)/share/man/man1"
SCRIPTS = $(wildcard bin/git-*)
MAN_PAGES = $(wildcard man/git-*.1)

.PHONY: install uninstall

install:
	@mkdir -p $(DESTDIR)$(MANPREFIX)
	@mkdir -p $(DESTDIR)$(PREFIX)/bin
	@$(foreach BIN, $(SCRIPTS), \
		echo "Installing `basename $(BIN)` -> $(DESTDIR)$(PREFIX)/bin"; \
		cp -f $(BIN) $(DESTDIR)$(PREFIX)/$(BIN); \
	)
	@$(foreach MAN, $(MAN_PAGES), \
		echo "Installing `basename $(MAN)` -> $(DESTDIR)$(MANPREFIX)"; \
		cp -f $(MAN) $(DESTDIR)$(MANPREFIX)/`basename $(MAN)`; \
	)

uninstall:
	@$(foreach BIN, $(SCRIPTS), \
		echo "Removing $(DESTDIR)$(PREFIX)/$(BIN)"; \
		rm -f $(DESTDIR)$(PREFIX)/$(BIN); \
	)
	@$(foreach MAN, $(MAN_PAGES), \
		echo "Removing $(DESTDIR)$(MANPREFIX)/$(MAN)"; \
		rm -f $(DESTDIR)$(MANPREFIX)/`basename $(MAN)`; \
	)
