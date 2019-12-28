## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|varchar|null: false|
|image|varchar|null: false|
|email|varchar|null: false|
|password|varchar|null: false|

### Association
- has_many :posts
- has_many :comments


## postsテーブル
|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|genre|integer|null: false|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :comments
- has_many :reactions
- has_many :images


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|user_id|references|null: false, foreign_key: true|
|post_id|references|null: false, foreign_key: true|

### Association
- belongs_to :post
- belongs_to :user

## reactionsテーブル
|Column|Type|Options|
|------|----|-------|
|reaction|integer|null: false|
|post_id|references|null: false, foreign_key: true|

### Association
- belongs_to :post


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|varchar|null: false|
|post_id|references|null: false, foreign_key: true|

### Association
- belongs_to :post