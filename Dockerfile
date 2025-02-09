FROM ruby:3.4.1

RUN apt update -yqq
RUN apt-get -q clean

RUN mkdir -p /app
WORKDIR /app

RUN gem update --system
COPY Gemfile* ./
RUN gem install bundler
RUN bundle install

COPY . .
RUN bundle binstubs --all

# RUN chmod +x docker-entrypoint.sh
# ENTRYPOINT ["/app/docker-entrypoint.sh"]