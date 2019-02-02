FROM nakoo/docker:ruby

RUN apk add --no-cache nodejs nodejs-npm \
    && curl -o- -L https://yarnpkg.com/install.sh | bash

ARG NODE_ENV
ENV NODE_ENV $NODE_ENV

COPY . /usr/src/app

WORKDIR /usr/src/app
EXPOSE 3000
CMD ["node", "./server"]