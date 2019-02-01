FROM ruby:2.6-alpine

RUN mkdir /usr/src/app \
    && chown $(id -un):$(id -gn) /usr/src/app \
    && apk add --no-cache libxml2-dev libxslt-dev  \
    && gem install bundler \
    && bundle config build.nokogiri --use-system-libraries

ENV RAILS_ENV=development

COPY . /usr/src/app

WORKDIR /usr/src/app
EXPOSE 3000
CMD ["bundle", "exec", "rake", "server"]