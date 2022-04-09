FROM ruby:2.7.5

RUN apt-get update
RUN apt-get install sudo
RUN sudo apt-get install -y nodejs
RUN sudo apt-get install -y gcc g++ make python2
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
RUN echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
RUN sudo apt-get update && sudo apt-get install -y yarn

WORKDIR /usr/src/app

ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_LOG_TO_STDOUT true

COPY package*.json ./
RUN yarn install

COPY Gemfile Gemfile.lock ./
RUN bundle config set without 'development test'
RUN bundle config --global frozen 1
RUN bundle install

COPY . .

RUN RAILS_ENV=production rails webpacker:compile

EXPOSE 3000

CMD ["rails", "server"]
