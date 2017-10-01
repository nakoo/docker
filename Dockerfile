FROM mhart/alpine-node:latest

RUN echo 'gem: --no-document' >> ~/.gemrc

RUN apk update && \
 apk upgrade && \
 apk add build-base git ruby ruby-dev libxslt-dev libffi-dev imagemagick
RUN npm install -g yarn --no-progress
RUN gem install bundler --pre
RUN rm -rf /var/cache/apk/*
