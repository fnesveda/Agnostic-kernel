ZIP = zip
ZIPFLAGS = -r

PROG=agnostic-kernel

OUTDIR=out
CONTENTSDIR=zip-contents
IMGDIR=images
TEMPLATEDIR=template-contents
TEMPDIR=temp

all : template prepacked

template :
	mkdir -p $(OUTDIR)
	mkdir -p $(TEMPDIR)
	cp -a $(CONTENTSDIR)/. $(TEMPDIR)/
	cp -a $(TEMPLATEDIR)/. $(TEMPDIR)/
	cd $(TEMPDIR); $(ZIP) $(ZIPFLAGS) ../$(OUTDIR)/$(PROG)-template.zip *;

prepacked :
	mkdir -p $(OUTDIR)
	mkdir -p $(TEMPDIR)
	cp -a $(CONTENTSDIR)/. $(TEMPDIR)/
	for img in $(IMGDIR)/*; do \
		zipname=`basename $$img .img`; \
		cp $$img $(TEMPDIR)/boot.img; \
		rm $(OUTDIR)/$(PROG)-$$zipname.zip ;\
		cd $(TEMPDIR) ; \
		$(ZIP) $(ZIPFLAGS) ../$(OUTDIR)/$(PROG)-$$zipname.zip * ; \
		cd .. ; \
		rm -f $(TEMPDIR)/boot.img; \
	done
	rm -rf $(TEMPDIR)
clean :
	rm -rf $(OUTDIR)
	rm -rf $(TEMPDIR)
