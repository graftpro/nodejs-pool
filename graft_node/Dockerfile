FROM ubuntu:16.04

ENV SRC_DIR /usr/local/src/graft

RUN apt-get update && apt-get install -y wget supervisor

WORKDIR /usr/local/bin

RUN wget https://github.com/graftpro/GraftNetwork/releases/download/v1.5.1/graft-wallet-rpc && \
  wget https://github.com/graftpro/GraftNetwork/releases/download/v1.5.1/graft-wallet-cli && \
  wget https://github.com/graftpro/GraftNetwork/releases/download/v1.5.1/graftnoded && \
  wget https://github.com/graftpro/GraftNetwork/releases/download/v1.5.1/graft-supernode && \
  wget https://github.com/graftpro/GraftNetwork/releases/download/v1.5.1/graft-blockchain-export && \
  wget https://github.com/graftpro/GraftNetwork/releases/download/v1.5.1/graft-blockchain-import && \
  chmod +x graft*

# Contains the blockchain
VOLUME /root/.graft

# Generate your wallet via accessing the container and run:
# cd /wallet
# graft-wallet-cli
VOLUME /wallet

COPY supervisord.conf /etc/supervisord.conf
COPY supervisord.node.conf /etc/supervisord.node.conf

CMD /usr/bin/supervisord -c /etc/supervisord.conf
