FROM ruby:2.6.5
RUN apt-get update -qq 
RUN gem install bundler:2.1.4
RUN mkdir /our_trip
WORKDIR /our_trip