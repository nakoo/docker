FROM mhart/alpine-node:latest

RUN echo 'gem: --no-document' >> ~/.gemrc

RUN apk update && \
 apk upgrade && \
 apk add build-base git ruby ruby-dev libxslt-dev libffi-dev
RUN npm install -g yarn --no-progress
RUN gem install bundler --pre
