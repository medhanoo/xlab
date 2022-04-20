FROM alpine:3.15.4
LABEL maintainer="git.medhanu@gmail.com"


COPY entrypoint.sh /entrypoint.sh

RUN set -xe \
    && apk add --no-cache --purge -uU \
       squid ca-certificates libressl \
    && rm -rf /var/cache/apk/* /tmp/* \
    && chmod u+x /entrypoint.sh

EXPOSE 3128

ENTRYPOINT ["/entrypoint.sh"]

