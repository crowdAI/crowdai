FROM ruby:2.5
MAINTAINER sean.carroll@epfl.ch

RUN apt-get update && apt-get install build-essential nodejs -y

# For Capyara Webkit only
RUN apt-get install qt5-default libqt5webkit5-dev gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x -y


RUN mkdir -p /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20 --retry 5
COPY . ./

ENTRYPOINT ["bundle","exec"]

EXPOSE 3000
CMD ["rails","server","-b","0.0.0.0"]
