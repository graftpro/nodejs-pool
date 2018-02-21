FROM node:8.9.3

WORKDIR /pool

RUN apt-get update && \
  apt-get -y install git python-virtualenv \
  python3-virtualenv curl ntp build-essential screen cmake pkg-config \
  libboost-all-dev libevent-dev libunbound-dev libminiupnpc-dev libunwind8-dev \
  liblzma-dev libldns-dev libexpat1-dev libgtest-dev lmdb-utils libzmq3-dev mysql-client && \
  npm install -g pm2 && pm2 install pm2-logrotate && \
  openssl req -subj "/C=US/ST=Pool/L=Daemon/O=Mining Pool/CN=mining.pool" -newkey rsa:2048 -nodes -keyout cert.key -x509 -out cert.pem -days 36500

COPY ["package.json", "/pool/"]
RUN npm version && \
  npm install --production

COPY . /pool/

CMD ["pm2-runtime", "process.yml"]
