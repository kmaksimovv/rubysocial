FROM ruby:2.7.5

RUN apt-get update
RUN apt-get install sudo
RUN sudo apt-get install -y nodejs
RUN sudo apt-get install -y gcc g++ make python2
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
RUN echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
RUN sudo apt-get update && sudo apt-get install -y yarn

WORKDIR /usr/src/app
COPY . .

ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_LOG_TO_STDOUT true

RUN yarn install
RUN bundle config set without 'development test'
RUN bundle config --global frozen 1
RUN bundle install
RUN RAILS_ENV=production bundle exec rake assets:precompile
RUN RAILS_ENV=production rails webpacker:compile
RUN RAILS_ENV=production rake assets:precompile

EXPOSE 3000

CMD ["rails", "server"]
