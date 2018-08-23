FROM ruby:2.5.1

ENV APP_HOME /app

RUN apt-get update -qq \
  && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    postgresql-common \
    postgresql-9.6 \
    postgresql-client \
    yarn \
  && apt-get clean autoclean \
  && apt-get autoremove -y \
  && rm -rf \
    /var/lib/apt \
    /var/lib/dpkg \
    /var/lib/cache \
    /var/lib/log


RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN gem install bundler && gem install foreman && bundle install --jobs 4 --retry 3

COPY . $APP_HOME
COPY config/application.yml.example config/application.yml

ENV REDIS_URL redis://redis:6379

#CMD bundle exec rails s -p ${PORT} -b '0.0.0.0'
CMD bundle exec rails s -b '0.0.0.0'


#CMD foreman start -f Procfile.dev
