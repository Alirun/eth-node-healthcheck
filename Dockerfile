FROM node:carbon-alpine

RUN apk add --no-cache --virtual .gyp \
  python \
  make \
  g++ \
  git \
  linux-headers bash openssh musl build-base ca-certificates

RUN mkdir /src
WORKDIR /src

COPY package*.json ./

RUN npm install --production

COPY . .

EXPOSE 8080

CMD [ "npm", "start" ]
