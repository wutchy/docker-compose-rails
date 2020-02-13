# docker-compose-rails
Rails開発環境用のDocker Compose設定ファイル

# 利用方法
1. Dockefile docker-compose.ymlの設定を自身の環境に合わせて書き換える。
2. docker-compose build
3. ローカルのマウントしているディレクトリでconfig/database.ymlのhostnameとpasswordを書き換える
4. docker container exec (webコンテナ名) rails db:create
5. docker contaienr exec (webコンテナ名) rails s -p 3000 -b 0.0.0.0
6. ローカルでlocalhost:3000にアクセスし、動作確認。
