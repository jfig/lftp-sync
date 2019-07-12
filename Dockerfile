FROM alpine:latest

MAINTAINER Joao Figueiredo <joao.figueiredo@jfig.net>

RUN apk add --no-cache lftp

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
