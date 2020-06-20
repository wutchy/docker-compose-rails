FROM ruby:2.7.0
# qqオプションでプログレスバーを除外
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt update -qq && \
    apt upgrade -y && \
    apt install sudo emacs nodejs yarn -y && \
    mkdir -p /sample_app &&\
    gem install bundler

# Ruby2.7.0に対応していないGemによるワーニングを隠したい場合、下記のコメントを外す。
# RUN echo "export RUBYOPT='-W:no-deprecated -W:no-experimental'" >> ~/.bashrc

ARG APP_ROOT=/sample_app

WORKDIR $APP_ROOT

COPY entrypoint.sh /usr/bin/

RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
