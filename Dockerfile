FROM ubuntu:zesty

RUN apt-get update && \
    apt-get -y install libssl-dev \
                       libevent-dev \
                       libtool \
                       autotools-dev \
                       libboost-system-dev \
                       libboost-filesystem-dev \
                       libboost-chrono-dev \
                       libboost-program-options-dev \
                       libboost-test-dev \
                       libboost-thread-dev

COPY bitcoin-abc/src/bitcoind bitcoin-abc/src/bitcoin-tx bitcoin-abc/src/bitcoin-cli /usr/bin/
VOLUME ["/var/lib/bitcoind"]
WORKDIR /var/lib/bitcoind
ENTRYPOINT ["/usr/bin/bitcoind", "-datadir=/var/lib/bitcoind"]
