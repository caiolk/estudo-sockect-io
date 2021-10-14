FROM node:alpine

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY /public ./
COPY /src ./
COPY server.js ./
COPY package.json ./
COPY package-lock.json ./

RUN npm install && apk add bash

COPY --chown=node:node . .

USER node

EXPOSE 3000

CMD ["node","server.js"]
