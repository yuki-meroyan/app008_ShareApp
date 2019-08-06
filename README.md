# README
**DB設計**

## summary table

|Column|Type|Options|
|------|----|-------|
|detail_id|references|null :false, foreign_key: true|
|user_id|references|null :false, foreign_key: true|
|genre_id|references|null :false, foreign_key: true|

### summary table Association

- has_many :photo
- has_many :genre
- has_many :user
- has_many :detail

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

- belongs_to :summary

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

### details Association

- belongs_to :summary

## users table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true, unique: true|
|email|string|null: false|

### users table Association

- belongs_to :summary

