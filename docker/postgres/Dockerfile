FROM postgres:15.3-alpine

COPY entrypoint.sh /usr/local/bin/postgres-ssl-entrypoint.sh
RUN chmod 755 /usr/local/bin/postgres-ssl-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/postgres-ssl-entrypoint.sh"]
CMD ["postgres", "-c", "ssl=on", "-c", "ssl_cert_file=/var/lib/postgresql/tls/server.crt", "-c", "ssl_key_file=/var/lib/postgresql/tls/server.key"]
