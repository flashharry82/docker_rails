FROM ruby:2.3.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
ENV RAILS_ENV="production" SECRET_KEY_BASE="$(openssl rand -base64 32)"

ENV APP_HOME /docker_rails
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/

RUN bundle install --without development
ADD . $APP_HOME

CMD bundle exec rails server -b 0.0.0.0 -p 3000
