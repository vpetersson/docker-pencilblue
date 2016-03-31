FROM node

RUN echo '{ "allow_root": true  }' > /root/.bowerrc
RUN \
  apt-get update && \
  apt-get install -y git-core && \
  apt-get clean

RUN \
  npm install -g pencilblue-cli bower && \
  git clone https://github.com/pencilblue/pencilblue.git /opt/pb && \
  cd /opt/pb && \
  npm install && \
  bower install && \
  npm cache clean && \
  bower cache clean

ADD config.js  /opt/pb/config.js
