FROM ruby:2.6.5
RUN apt-get update -qq 
RUN mkdir /our_trip
WORKDIR /our_trip
RUN gem install bundler:2.1.4
RUN bundle install