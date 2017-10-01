FROM mhart/alpine-node:latest

RUN echo 'gem: --no-document' >> ~/.gemrc

RUN apk update && \
 apk upgrade && \
 apk add git ruby ruby-dev gcc g++ libc-dev libxml2-dev libxslt-dev libffi-dev
RUN npm install -g yarn --no-progress
RUN gem install bundler --pre
