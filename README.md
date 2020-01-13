# DIDITについて
## 1.アプリケーション概要
「よくやったね！！」と、他人を褒めるアプリです。  
  
## 2.アプリケーションの制作背景
- 目的  
「正の要素」を目的としたSNSアプリケーションの行うことにした。  
- 理由  
近年、SNSは非常に優先度の高いコミュニケーションツールである。  
一方で、匿名を利用した誹謗中傷など、「負の要素」が強くなっている。  
加えて、精神病や自殺などの社会問題からメンタルヘルスの重要性は高まっている。  
これらのことから、少しでも心の支えになる物作りをしたいと考えた。  
  
## 3.実装機能一覧  
- postの投稿／削除  
- postの詳細表示  
- userのログイン, ログアウト機能  
- userの編集機能（e-mail, passwordのみ）  
- userの削除機能  
- commentの一覧表示機能  
- いいね機能  
- いいねとコメントのcount機能  
- フラッシュメッセージの表示／fade-out機能  
  
## 4.使用した言語など  
- HTML5/CSS3(Haml,Sass)  
- Ruby (2.5.1)  
- Ruby on Rails (6.0.1)  
- jQuery (3.4.1)  
- mysql (5.7)  

## 5.今後の実装機能
- 画像投稿機能
- コメントに対してのいいね機能
- 削除要請機能
- いいね以外のリアクションの追加
- フォロー機能

## 6.DB設計  

### usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|varchar|null: false|
|image|varchar|null: false|
|email|varchar|null: false|
|password|varchar|null: false|

#### Association
- has_many :posts
- has_many :comments


### postsテーブル
|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|genre|integer|null: false|
|user_id|references|null: false, foreign_key: true|

#### Association
- belongs_to :user
- has_many :comments
- has_many :reactions
- has_many :images


### commentsテーブル
|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|user_id|references|null: false, foreign_key: true|
|post_id|references|null: false, foreign_key: true|

#### Association
- belongs_to :post
- belongs_to :user

### reactionsテーブル
|Column|Type|Options|
|------|----|-------|
|reaction|integer|null: false|
|post_id|references|null: false, foreign_key: true|

#### Association
- belongs_to :post


### imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|varchar|null: false|
|post_id|references|null: false, foreign_key: true|

#### Association
- belongs_to :post
