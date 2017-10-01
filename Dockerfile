FROM mhart/alpine-node:latest

RUN mkdir -p /usr/local/etc \
 && echo 'gem: --no-ri --no-rdoc' >> /usr/local/etc/gemrc

RUN apk update && \
 apk upgrade && \
 apk add git ruby
RUN npm install -g yarn --no-progress
RUN gem install bundler
