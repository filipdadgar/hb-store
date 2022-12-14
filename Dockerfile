FROM ubuntu:18.04

RUN apt-get update && \
    apt-get -y install ca-certificates wget && \
    apt-get -y autoremove && \
    apt-get clean

ADD https://github.com/Gkiokan/hb-store-cdn-cli-server/releases/download/v1.2.0/hb-store-cdn-cli-server-linux /app/hb-store-cdn-cli-server-linux
RUN chmod a+x /app/hb-store-cdn-cli-server-linux

ARG host=localhost
ARG port=8888
ARG base=/media/download/PS4

RUN echo "host="$host >> /app/config.ini
RUN echo "port="$port >> /app/config.ini
RUN echo "basePath=/Downloads" >> /app/config.ini
RUN echo "binVersion=4.31" >> /app/config.ini

CMD /app/hb-store-cdn-cli-server-linux start
