#!/bin/sh


SQUID=$(/usr/bin/which squid)

if [ -d $CACHE_DIR ]
then 
	echo '==> Setting permissions for cache dir'
	chown -v -R squid:squid $CACHE_DIR
fi

if [ -d $LOG_DIR ]
then
	echo '==> Setting permissions for log dir'
	chown -v -R squid:squid $LOG_DIR
fi

initialize_cache() {
	echo "Creating cache folder..."
	"$SQUID" -z
	sleep 5
}


run() {
	echo "Starting squid..."
	initialize_cache
	exec "$SQUID" -NYCd 1 -f /etc/squid/squid.conf
}


run
