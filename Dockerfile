from ubuntu:bionic

ENV TZ=Europe/Rome
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y libmpdclient-dev
RUN apt-get install -y git
RUN apt-get install -y cmake
RUN apt-get install -y libssl-dev

RUN rm -rf /var/lib/apt/lists/*

RUN mkdir /src
WORKDIR /src
RUN git clone https://github.com/notandy/ympd.git
WORKDIR /src/ympd

RUN mkdir /src/ympd/build
WORKDIR /src/ympd/build
RUN cmake .. -DCMAKE_INSTALL_PREFIX:PATH=/usr
RUN make
RUN make install

EXPOSE 8080

ENV MPD_HOSTNAME localhost
ENV MPD_PORT 6600
ENV YMPD_WEB_PORT 8080

ENV STARTUP_DELAY_SEC 0

COPY run-ympd.sh /run-ympd.sh
RUN chmod u+x /run-ympd.sh

ENTRYPOINT ["/run-ympd.sh"]

