#!/bin/bash

/opt/squid/libexec/security_file_certgen -c -s /opt/squid/var/logs/ssl_db -M 20MB

sleep 2

/opt/squid/sbin/squid -z

sleep 2

exec /opt/squid/sbin/squid -NYCd 10

