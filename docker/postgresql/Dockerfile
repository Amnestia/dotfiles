FROM postgres:latest

COPY ssl/server.key /var/lib/postgresql/server.key
COPY ssl/server.crt /var/lib/postgresql/server.crt

RUN chown postgres:postgres /var/lib/postgresql/server.* && \
	chmod 600 /var/lib/postgresql/server.*
