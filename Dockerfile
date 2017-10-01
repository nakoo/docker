FROM mhart/alpine-node:latest

RUN echo 'gem: --no-document' >> ~/.gemrc

RUN apk update && \
 apk upgrade && \
 apk add git ruby gcc gdbm-dev glib-dev libc-dev libffi-devlibxml2-devlibxslt-dev
RUN npm install -g yarn --no-progress
RUN gem install bundler --pre
