# docker-compose-rails
Rails開発環境用のDocker Compose設定ファイル

### Docker Hub
https://hub.docker.com/r/wutchy/rails6_dev

## 利用方法
1. Dockefile docker-compose.ymlの設定を自身の環境に合わせて書き換える。
2. docker-compose build
3. ローカルのマウントしているディレクトリでconfig/database.ymlのhostnameとpasswordを書き換える
4. docker container exec (webコンテナ名) rails db:create
5. docker contaienr exec (webコンテナ名) rails s -p 3000 -b 0.0.0.0
6. ローカルでlocalhost:3000にアクセスし、動作確認。

## 注意
現在ruby2.7.0に対応できていないGemが多いため、多くのワーニングが出現します。
よって、これらのワーニングが目障りな場合、環境変数RUBYOPTに'-W:no-deprecated -W:no-experimental'を指定することで隠すことができます。
隠したい場合は、dockerのホームディレクトリ内の.bashrcや.zshrcに"export RUBYOPT='-W:no-deprecated -W:no-experimental'"を書き込んでください。
ただし、これはあくまで、ワーニングを隠しているだけのため、GemがRuby2.7.0に対応次第、アップデートするべきでしょう。
