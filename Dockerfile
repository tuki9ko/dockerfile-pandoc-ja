FROM pandoc/latex:2.11.1.1

RUN tlmgr install \
		bxjscls \
		bxwareki \
		everyhook \
		ipaex \
		luatexja \
		svn-prov \
		type1cm \
		selnolig && \
		tlmgr update latex

RUN mkdir -p /opt/texlive/texmf-local/fonts/opentype/public/haranoaji

RUN wget http://mirrors.ctan.org/fonts/haranoaji.zip && \
	unzip haranoaji.zip && \
	mv haranoaji/*.otf /opt/texlive/texmf-local/fonts/opentype/public/haranoaji && \
	rm -fr haranoaji.zip && rm -fr haranoaji

RUN wget http://mirrors.ctan.org/fonts/haranoaji-extra.zip && \
	unzip haranoaji-extra.zip && \
	mv haranoaji-extra/*.otf /opt/texlive/texmf-local/fonts/opentype/public/haranoaji && \
	rm -fr haranoaji-extra.zip && rm -fr haranoaji-extra

RUN mktexlsr

RUN wget -O - https://github.com/lierdakil/pandoc-crossref/releases/download/v0.3.8.3/pandoc-crossref-Linux.tar.xz | \
	tar Jxf - && \
	mv pandoc-crossref /usr/lib/ && \
	rm -fr pandoc-crossref.1

RUN wget -O - https://github.com/ryangrose/easy-pandoc-templates/archive/master.tar.gz | \
	tar zxf - -C /tmp/ && \
	mv /tmp/easy-pandoc-templates* /usr/lib/easy-pandoc-templates && \
	rm -fr /tmp/*

