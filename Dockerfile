FROM mhart/alpine-node:latest

RUN mkdir -p /usr/local/etc && \
    { \ echo 'install: --no-document'; \ echo 'update: --no-document'; \ } >> /usr/local/etc/gemrc \
ENV RUBY_MAJOR 2.2 ENV RUBY_VERSION 2.2.6 \
ENV RUBY_DOWNLOAD_SHA256 de8e192791cb157d610c48a9a9ff6e7f19d67ce86052feae62b82e3682cc675f ENV RUBYGEMS_VERSION 2.6.4

RUN apk update && \  
    apk upgrade && \
    apk add git ruby
RUN npm install -g yarn --no-progress
RUN gem install bundler
