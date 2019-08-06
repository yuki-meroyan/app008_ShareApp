# README
**DB設計**

## summary table

|Column|Type|Options|
|------|----|-------|
|user_id|references|null :false, foreign_key: true|
|genre_id|references|null :false, foreign_key: true|

### summary table Association

- has_many :photos
- has_many :details
- belongs_to :user
- belongs_to :genre

## photos table

|Column|Type|Options|
|------|----|-------|
|image|string|
|summary_id|references|null :false, foreign_key: true|

### photos Association

- belongs_to :summary

## genres table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true, unique: true|

### genres Association

- has_many :summarys

## details table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|price|integer|
|address|text|index: true|
|url|text|
|recommendation|string|
|features|text|
|opentime|date|
|closetime|date|
|note|text|
|summary_id|references|null :false, foreign_key: true|
|user_id|references|null :false, foreign_key: true|

### details Association

- belongs_to :summary
- belongs_to :user

## users table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true, unique: true|
|email|string|null: false|

### users table Association

- has_many :summarys
- has_many :details
