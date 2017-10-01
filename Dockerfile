FROM mhart/alpine-node:latest

RUN echo 'gem: --no-document' >> ~/.gemrc

RUN apk update && \
 apk upgrade && \
 apk add build-base ca-certificates openssl git ruby ruby-dev libxslt-dev libffi-dev imagemagick && \
 wget -qO- "https://github.com/dustinblackman/phantomized/releases/download/2.1.1a/dockerized-phantomjs.tar.gz" | tar xz -C /
RUN gem install bundler --pre
RUN rm -rf /var/cache/apk/*
