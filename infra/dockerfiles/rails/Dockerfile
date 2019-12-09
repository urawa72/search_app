FROM ruby:2.6.3
ENV LANG C.UTF-8

# nodejsとbundler
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev && rm -rf /var/lib/apt/lists/*
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs
RUN gem install bundler

# rails準備
WORKDIR /tmp
COPY ./infra/docker-init.sh /tmp/init.sh
RUN chmod +x /tmp/init.sh
COPY ./backend/Gemfile Gemfile
COPY ./backend/Gemfile.lock Gemfile.lock
RUN bundle install
ENV APP_HOME /myapp
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

CMD "bundle exec rails s -b 0.0.0.0"
