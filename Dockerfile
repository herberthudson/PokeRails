FROM ruby:2.6.3

RUN apt-get update -q && apt-get install -y curl software-properties-common

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -

RUN apt-get install nodejs

RUN mkdir /pokeapp

WORKDIR /pokeapp

ADD Gemfile /pokeapp/Gemfile

ADD Gemfile.lock /pokeapp/Gemfile.lock

RUN gem install bundler

RUN bundler install

ADD . /pokeapp
