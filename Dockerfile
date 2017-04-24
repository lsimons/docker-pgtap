FROM alpine:3.5
MAINTAINER Andreas Wålm <andreas@walm.net>
MAINTAINER Ludovic Claude <ludovic.claude@laposte.net>

RUN apk update && apk add bash curl git postgresql-client postgresql-dev build-base make perl perl-dev

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

ENTRYPOINT ["/test.sh"]
CMD [""]

LABEL org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.name="lren/pgtap" \
    org.label-schema.description="pgTAP - Unit testing for PostgreSQL" \
    org.label-schema.url="https://github.com/LREN-CHUV/docker-pgtap" \
    org.label-schema.vcs-type="git" \
    #org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.vcs-url="https://github.com/LREN-CHUV/docker-pgtap" \
    org.label-schema.vendor="CHUV LREN" \
    org.label-schema.docker.dockerfile="Dockerfile" \
    org.label-schema.schema-version="1.0"
