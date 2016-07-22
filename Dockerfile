FROM ruby:2.3.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
ENV RAILS_ENV="production" SECRET_KEY_BASE="$(openssl rand -base64 32)"

RUN mkdir /docker_rails
WORKDIR /docker_rails

ADD Gemfile /docker_rails/Gemfile
ADD Gemfile.lock /docker_rails/Gemfile.lock
RUN bundle install --without development
ADD . /docker_rails
RUN bundle exec rake assets:precompile

EXPOSE 3000
