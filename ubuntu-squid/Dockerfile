FROM ubuntu:20.04

COPY --chown=566751145:566751145 squid /opt/squid
COPY --chown=566751145:566751145 entrypoint.sh /entrypoint.sh

RUN chmod u+x /entrypoint.sh

RUN apt-get update \
    && apt-get install -y openssl libssl-dev ca-certificates \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/*

USER 566751145
ENTRYPOINT ["/entrypoint.sh"]
