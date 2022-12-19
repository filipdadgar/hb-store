FROM ubuntu:18.04

RUN apt-get update && \
    apt-get -y install ca-certificates wget && \
    apt-get -y autoremove && \
    apt-get clean

ADD https://github.com/Gkiokan/hb-store-cdn-cli-server/releases/download/v1.3.0/hb-store-cdn-cli-server-linux /app/hb-store-cdn-cli-server-linux
RUN chmod a+x /app/hb-store-cdn-cli-server-linux

# Not needed anymore since latest release of cli-server
# keeping it here in case of debugging.
#
#ADD https://github.com/LightningMods/PS4-Store/releases/download/4.31/homebrew.elf /app/bin/homebrew.elf
#ADD https://github.com/LightningMods/PS4-Store/releases/download/4.31/homebrew.elf.sig /app/bin/homebrew.elf.sig
#ADD https://github.com/LightningMods/PS4-Store/releases/download/4.31/remote.md5 /app/bin/remote.md5
#

ARG host=ps4repo.domain.com
ARG port=8888
ARG base=/repo

RUN echo "host="$host >> /app/config.ini
RUN echo "port="$port >> /app/config.ini
RUN echo "basePath=/repo" >> /app/config.ini
RUN echo "binVersion=4.31" >> /app/config.ini

CMD /app/hb-store-cdn-cli-server-linux check-bin && /app/hb-store-cdn-cli-server-linux start
