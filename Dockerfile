FROM alpine:3.5
MAINTAINER Andreas Wålm <andreas@walm.net>
MAINTAINER Ludovic Claude <ludovic.claude@chuv.ch>

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

ENV DOCKERIZE_VERSION=v0.4.0

RUN apk update && apk add bash curl openssl ca-certificates git postgresql-client postgresql-dev \
      build-base make perl perl-dev \
    && update-ca-certificates \
    && wget -O /tmp/dockerize.tar.gz https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-${DOCKERIZE_VERSION}.tar.gz \
    && tar -C /usr/local/bin -xzvf /tmp/dockerize.tar.gz \
    && rm -rf /var/cache/apk/* /tmp/*

# install pg_prove
RUN cpan TAP::Parser::SourceHandler::pgTAP

# install pgtap
ENV PGTAP_VERSION v0.96.0
RUN git clone git://github.com/theory/pgtap.git \
    && cd pgtap && git checkout tags/$PGTAP_VERSION \
    && make

COPY docker/test.sh /test.sh
RUN chmod +x /test.sh

WORKDIR /

ENV DATABASE="" \
    HOST=db \
    PORT=5432 \
    USER="postgres" \
    PASSWORD="" \
    TESTS="/test/*.sql"

ENTRYPOINT ["/test.sh"]
CMD [""]

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="hbpmip/pgtap" \
      org.label-schema.description="pgTAP - Unit testing for PostgreSQL" \
      org.label-schema.url="https://github.com/LREN-CHUV/docker-pgtap" \
      org.label-schema.vcs-type="git" \
      org.label-schema.vcs-url="https://github.com/LREN-CHUV/docker-pgtap" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.version="$VERSION" \
      org.label-schema.vendor="LREN CHUV" \
      org.label-schema.license="Apache2.0" \
      org.label-schema.docker.dockerfile="Dockerfile" \
      org.label-schema.schema-version="1.0"
