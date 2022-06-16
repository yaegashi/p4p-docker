FROM debian:bullseye-slim
ARG P4REL=r20.2
RUN apt-get update && apt-get dist-upgrade -y && apt-get install -y curl gosu
RUN adduser --system --group --uid 1000 p4
RUN curl -sL http://www.perforce.com/downloads/perforce/$P4REL/bin.linux26x86_64/p4 -o /usr/local/bin/p4
RUN curl -sL http://www.perforce.com/downloads/perforce/$P4REL/bin.linux26x86_64/p4p -o /usr/local/bin/p4p
RUN chmod +x /usr/local/bin/p4 /usr/local/bin/p4p
ENV P4TARGET=
ENV P4PORT=ssl:1666
VOLUME /data
EXPOSE 1666
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
