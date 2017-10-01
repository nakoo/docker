FROM mhart/alpine-node:latest

RUN mkdir -p /usr/local/etc \
 && { \ echo 'install: --no-document'; \
  echo 'update: --no-document'; \
  } >> /usr/local/etc/gemrc
   
RUN apk update && \
  apk upgrade && \
  apk add git ruby
RUN npm install -g yarn --no-progress
RUN gem install bundler
