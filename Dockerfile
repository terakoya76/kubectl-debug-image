FROM nicolaka/netshoot:latest

RUN set -ex \
    && apk update \
    && apk upgrade \
    && apk add --no-cache \
    htop \
    git \
    perf \
    procps \
    sysstat \
    && git clone https://github.com/scottchiefbaker/dool.git \
    && sed -i -e "1,1s/python/python3/" dool/dool \
    && ln -s /dool/dool /usr/local/bin/dool

CMD ["/bin/bash","-l"]
