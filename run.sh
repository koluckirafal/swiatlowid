#!/bin/sh
set -e

# Restore the database if it does not already exist.
if [ -z ${REPLICA_URL+x} ]; then
echo "/!\\ Replica URL not set /!\\"
else
	if [ -f /data/db ]; then
		echo "Database already exists, skipping restore"
	else
		echo "No database found, restoring from replica if exists"
		litestream restore -v -if-replica-exists /data/db
	fi
fi


# Run litestream with your app as the subprocess.
if [ -z ${REPLICA_URL+x} ]; then
	exec python3 -m swiatlowid
else
	exec litestream replicate -exec "python3 -m swiatlowid"
fi
