FROM mhart/alpine-node:latest
RUN apk update && \  
    apk upgrade && \
    apk add git ruby
RUN npm install -g yarn --no-progress
RUN gem install bundler
