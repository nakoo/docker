FROM ruby:2.6-alpine

RUN mkdir /usr/src/app \
    && chown $(id -un):$(id -gn) /usr/src/app \
    && apk add --no-cache build-base \
    && gem install bundler

ENV RAILS_ENV=development

COPY . /usr/src/app

RUN cd /usr/src/app \
    && bundle install --no-color

WORKDIR /usr/src/app
EXPOSE 3000
CMD ["bundle", "exec", "rake", "server"]