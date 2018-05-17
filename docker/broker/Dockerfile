FROM node:6
MAINTAINER sean.carroll@epfl.ch

RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/crowdAI/crowdai-broker-nodejs.git
RUN npm install
EXPOSE 8888
CMD ["node","server.js"]
