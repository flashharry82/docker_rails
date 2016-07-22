FROM ruby:2.3.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /docker_rails
WORKDIR /docker_rails
ADD Gemfile /docker_rails/Gemfile
ADD Gemfile.lock /docker_rails/Gemfile.lock
RUN bundle install
ADD . /docker_rails
