FROM ruby:2.7.0
# qqオプションでプログレスバーを除外
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt update -qq && \
    apt upgrade -y && \
    apt install sudo emacs nodejs yarn -y && \
    mkdir homepage &&\
    gem install bundler

ENV APP_ROOT /sample_app

WORKDIR $APP_ROOT

RUN bundle init && \
    echo "gem 'rails', '~> 6.0', '>= 6.0.2'" >> Gemfile && \
    bundle install && \
    rails new . --force --database=mysql --skip-bundle --skip-webpack-install&& \
    bundle install && \
    rails webpacker:install
