all: directory

directory: directory.in
	@rm -f $@
	@sed -e "s|%PWD%|$${PWD}|g" \
	    $< > $@

clean: 
	rm -f directory
