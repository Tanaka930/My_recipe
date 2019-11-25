# README

# アプリケーション概要
料理レシピ投稿サービス

# アプリケーションの機能一覧



# アプリケーション内で使用している技術一覧

|種別|名称|
|----|---|
|開発言語|Ruby(ver 2.5.1)|
|フレームワーク|Ruby on Rails(ver 5.2.3)|
|マークアップ|HTML(Haml),CSS(Sass)|
|フロントエンド|JavaScript(jQuery)|
|DB|MySQL|
|本番環境|Heroku|
|画像アップロード|carrierwave, AWS S3|
|自動デプロイ|Heroku|
|ユーザー管理|devise|


## recipesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|image|string|null: false|
|text|text|null: false|
|material|string||
|seasoning|string||
|my_text|text|null: false|
|time|string||
|category|string||
|created_at|datetime|null: false|
|updated_at|datetime|null: false|


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string||default: |null: false|
|encrypted_password|string||default: |null: false|
|reset_password_token|string|
|reset_password_sent_at|datetime||
|remember_created_at|datetime|
|name|string|null: false|
|icon|string||
|prof|text||
|birthday|date||
|gender|string|||
|created_at|datetime|null: false|
|updated_at|datetime|null: false|



## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
|created_at|datetime|null: false|
|updated_at|datetime|null: false|