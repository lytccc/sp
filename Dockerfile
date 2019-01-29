FROM alpine:3.8
RUN apk add --no-cache squid && \
        chown -R squid:squid /var/cache/squid && \
        chown -R squid:squid /var/log/squid

COPY squid.conf /etc/squid/squid.conf
COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

EXPOSE 3128/tcp

ENTRYPOINT ["/entrypoint.sh"]