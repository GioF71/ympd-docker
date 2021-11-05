from alpine

RUN apk add --no-cache ympd

EXPOSE 8080

ENV MPD_HOSTNAME localhost
ENV MPD_PORT 6600
ENV YMPD_WEB_PORT 8080

ENV STARTUP_DELAY_SEC 0

COPY run-ympd.sh /run-ympd.sh
RUN chmod u+x /run-ympd.sh

ENTRYPOINT ["/run-ympd.sh"]

