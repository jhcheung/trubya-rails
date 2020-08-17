FROM ruby:2.6.1
ENV BUNDLER_VERSION=2.0.2

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

WORKDIR /app

COPY Gemfile ./
COPY Gemfile.lock ./

RUN gem install bundler -v 2.0.2
RUN bundle check || bundle install

COPY . ./
ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]