FROM nicolaka/netshoot:latest

COPY scripts/bashrc /.bashrc

RUN set -ex \
    && apk update \
    && apk upgrade \
    && apk add --no-cache \
    htop \
    # iotop \
    git \
    perf \
    procps \
    sysstat \
    && git clone https://github.com/scottchiefbaker/dool.git ~/.dool\
    && sed -i -e "1,1s/python/python3/" ~/.dool/dool \
    && mv /.bashrc $HOME/.bashrc \
    && echo '. "$HOME/.bashrc"' >> /etc/profile

CMD ["/bin/bash","-l"]
