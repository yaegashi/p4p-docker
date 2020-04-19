FROM alpine
ARG P4REL=r19.2
RUN apk add curl
RUN curl -OL http://www.perforce.com/downloads/perforce/$P4REL/bin.linux26x86_64/p4
RUN curl -OL http://www.perforce.com/downloads/perforce/$P4REL/bin.linux26x86_64/p4p
RUN chmod +x p4 p4p

FROM ubuntu:18.04
ENV P4TARGET=
ENV P4PORT=ssl:1666
ENV P4SSLDIR=/data/ssl
ENV P4PCACHE=/data/cache
ENV P4TRUST=/data/trust
VOLUME /data
EXPOSE 1666
COPY --from=0 /p4 /p4p /bin/
COPY entrypoint.sh /
CMD ["/entrypoint.sh"]
