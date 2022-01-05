FROM rocker/r-rspm:20.04

RUN R -q -e 'install.packages("pak")'
RUN R -q -e 'pak::pak("RPostgres", dependencies = TRUE)'
RUN R -q -e 'pak::pak(c("pkgload", "pkgbuild"), dependencies = TRUE)'

RUN apt-get update && apt-get install -y --no-install-recommends \
	git \
	libpq-dev \
	postgresql-client-common \
	postgresql-client-12 \
	tini

RUN git clone https://github.com/r-dbi/RPostgres && \
	cd RPostgres && R -q -e 'pkgload::load_all()'

WORKDIR RPostgres
ENTRYPOINT ["/usr/bin/tini", "-g", "--"]
CMD R
