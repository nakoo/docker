FROM mhart/alpine-node:latest

RUN echo 'gem: --no-document' >> ~/.gemrc

RUN apk update && \
 apk upgrade && \
 apk add git ruby libc-dev ruby-dev
RUN npm install -g yarn --no-progress
RUN gem install bundler --pre
