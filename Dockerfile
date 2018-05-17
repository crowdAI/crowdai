FROM ruby:2.5
MAINTAINER sean.carroll@epfl.ch

RUN apt-get update -qq

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install build-essential nodejs -y
RUN apt-get update && apt-get install -y yarn

# For Capyara Webkit only
RUN apt-get install qt5-default libqt5webkit5-dev gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x -y

RUN mkdir /app
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN gem install bundler && bundle install --jobs 20 --retry 5
COPY . /app

ENTRYPOINT ["bundle","exec"]

EXPOSE 3000
CMD foreman start -f Procfile.dev
#CMD RAILS_ENV=development bundle exec rails s -p 3000 -b '0.0.0.0'
