FROM ruby:2.4-alpine3.6

ENV WORKDIR /opt

RUN \
mkdir -p ${WORKDIR} /opt/release

WORKDIR ${WORKDIR}

ADD Gemfile ${WORKDIR}/Gemfile

RUN \
apk add --no-cache curl git make gcc g++ libc-dev tar && \
bundle

ADD Makefile ${WORKDIR}/Makefile

ENTRYPOINT []
CMD [ "/bin/sh" ]
