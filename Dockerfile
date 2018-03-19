FROM ruby:2.5.0

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install build-essential nodejs -y
RUN apt-get update && apt-get install -y yarn
# RUN apt-get update && apt-get install build-essential nodejs libpq-dev -y

RUN mkdir /app

WORKDIR /app

COPY Gemfile ./Gemfile

COPY Gemfile.lock ./Gemfile.lock

RUN bundle install

COPY . .

RUN npm install

RUN /app/bin/webpack

RUN chmod +x /app/entrypoint.sh