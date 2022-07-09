FROM casjaysdevdocker/alpine:latest as base

RUN apk add --no-cache mariadb-client mariadb && \
  mkdir -p /var/lib/mysql && \
  mkdir -p /var/lib/dbbackups

COPY ./bin/. /usr/local/bin/

FROM base
ARG BUILD_DATE="$(date +'%Y-%m-%d %H:%M')" 

LABEL \
  org.label-schema.name="mariadb" \
  org.label-schema.description="MariaDB SQL Server" \
  org.label-schema.url="https://hub.docker.com/r/casjaysdevdocker/mariadb" \
  org.label-schema.vcs-url="https://github.com/casjaysdevdocker/mariadb" \
  org.label-schema.build-date=$BUILD_DATE \
  org.label-schema.version=$BUILD_DATE \
  org.label-schema.vcs-ref=$BUILD_DATE \
  org.label-schema.license="WTFPL" \
  org.label-schema.vcs-type="Git" \
  org.label-schema.schema-version="1.0" \
  org.label-schema.vendor="CasjaysDev" \
  maintainer="CasjaysDev <docker-admin@casjaysdev.com>" 

EXPOSE 3306 
VOLUME ["/var/lib/mysql","/var/lib/dbbackups","/etc/mysql"]

HEALTHCHECK CMD ["usr/local/bin/docker-entrypoint.sh", "healthcheck"]
ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]
