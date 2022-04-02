FROM ruby:2.7.5-alpine

WORKDIR /usr/src/app

RUN apk add python2 make g++
RUN apk add yarn nodejs
RUN apk add build-essential

COPY . .

RUN yarn install
RUN bundle config --global frozen 1
RUN bundle install --without development test

ENV RAILS_ENV production
RUN rails webpacker:compile

EXPOSE 3000
CMD ['rails', 'server', '-b', '0.0.0.0']
