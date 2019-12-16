FROM isaackuang/alpine-base:3.8

RUN apk --no-cache --progress add \
    gcc python && \
    apk add --virtual .build-deps autoconf make g++ && \
    cd /tmp && \
    wget https://github.com/ideawu/ssdb/archive/1.9.4.tar.gz && \
    tar zxvf 1.9.4.tar.gz && \
    cd ssdb-1.9.4 && \
    make && make install && \
    cd /tmp && rm -rf ssdb && \
    apk del .build-deps

COPY config /