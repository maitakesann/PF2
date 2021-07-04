# MC_Board

 昨今の情勢にて自粛の影響もあり、家で過ごすことや、リモートワークなどが増加してきています。自粛生活以前は運動など行えていたけど自然と運動する機会が減少したり、パソコンの作業などが増加し、体が重いなどの経験が増えてきていると思います。作者がリハビリテーションを行っていた経験をお伝えすると、身体状態が悪化してから来院していただく方が多い印象がありました。そのため、事前に自身の状態がどのような状態なのか・また、他の人がどのような状態なのかをコメントできる場所を作ってみました。様々な方々の経験談や不安に感じていることなどをコメントしあって参考にできれば良いなと考えてこのサイトを作成しました。

# 開発環境
AWS Cloud9 Ruby ver. 2.6.3 Ruby on rails ver. 5.2.5

# Gem
* gem 'devise'
* gem 'bootstrap', '~> 4.5'
* gem 'jquery-rails'
* gem "refile", require: "refile/rails", github: 'manfe/refile'
* gem "refile-mini_magick"
* gem 'font-awesome-sass', '~> 5.13'
* gem 'mysql2'


# ログインについて
  新規登録行っていだだければ使用できます。
 * name: 'Luke' password: "aaaaaa"。<br>
 * このアカウントに管理者機能を付与しています。
 
#実装機能
* ログイン機能
* 投稿機能
* いいね・コメント機能
* フォロー機能
* 検索機能
* タグ機能
* 管理者を付与　コメントの削除を可能に
* いいね・コメント機能・フォロー機能の非同期通信

#チャレンジ機能一覧
https://docs.google.com/spreadsheets/d/1Rk6aTQOfv4QKRbG0ZXCJdGB6ORAf2NTDdH0LJl4SMcU/edit#gid=0
