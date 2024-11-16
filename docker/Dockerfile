FROM debian:bookworm-slim
LABEL org.opencontainers.image.source=https://github.com/yaegashi/p4p-docker
LABEL org.opencontainers.image.description="Helix Core Proxy Server (P4P)"
LABEL org.opencontainers.image.licenses="LicenseRef-Proprietary https://www.perforce.com/license-agreements"
ARG P4REL=r24.2
RUN apt-get update && apt-get dist-upgrade -y && apt-get install -y curl gosu
RUN adduser --system --group --uid 1000 p4
RUN curl -sL http://www.perforce.com/downloads/perforce/$P4REL/bin.linux26$(uname -m)/p4 -o /usr/local/bin/p4
RUN curl -sL http://www.perforce.com/downloads/perforce/$P4REL/bin.linux26$(uname -m)/p4p -o /usr/local/bin/p4p
RUN chmod +x /usr/local/bin/p4 /usr/local/bin/p4p
ENV P4SSLDIR=/data/ssl
ENV P4PCACHE=/data/cache
ENV P4TRUST=/data/trust
ENV P4TARGET=
ENV P4PORT=ssl:1666
VOLUME /data
EXPOSE 1666
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
