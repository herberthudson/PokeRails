FROM ruby:2.6.3

RUN apt-get update -qq && apt-get install -y nodejs

RUN mkdir /pokeapp

WORKDIR /pokeapp

ADD Gemfile /pokeapp/Gemfile

ADD Gemfile.lock /pokeapp/Gemfile.lock

RUN gem install bundler

RUN bundler install

ADD . /pokeapp
