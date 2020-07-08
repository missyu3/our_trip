FROM ruby:2.6.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN gem install bundler:2.1.4
RUN mkdir /our_trip
WORKDIR /our_trip