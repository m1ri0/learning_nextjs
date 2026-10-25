#!/bin/sh
set -eu

# Prepare TLS on every start, including when the database already exists.
case "${1:-}" in
postgres|-*)
    umask 077
    mkdir -p /var/lib/postgresql/tls
    cp /run/postgresql-certs/server.crt /var/lib/postgresql/tls/server.crt
    cp /run/postgresql-certs/server.key /var/lib/postgresql/tls/server.key
    chown postgres:postgres /var/lib/postgresql/tls \
        /var/lib/postgresql/tls/server.crt /var/lib/postgresql/tls/server.key
    chmod 700 /var/lib/postgresql/tls
    chmod 644 /var/lib/postgresql/tls/server.crt
    chmod 600 /var/lib/postgresql/tls/server.key
    ;;
esac

# Keep the official initialization and switch to the postgres user.
exec /usr/local/bin/docker-entrypoint.sh "$@"
