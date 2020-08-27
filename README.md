https://gyazo.com/9abc7585443f2564841250649b05b784

## users table
|Column|Type|Options|
|------|----|-------|
|nickname|string|null false|
|firstname|string|null false|
|lastname|string|null false|
|first_hurigana|string|null false|
|last_hurigana|string|null false|
|birthday|date|null false|
|email|string|null false, unique true|
|password|string|null false, unique true, length:minimum:7|

### Association
- has_one :address
- has_many :cards
- has_many :items

## cards table
|Column|Type|Options|
|------|----|-------|
|customer_id|string|null false|
|card_id|string|null false|
|user_id|integer|null false, foreign_key true|

### Association
- belongs_to :user

## addresses table

|Column|Type|Options|
|------|----|-------|
|post|integer|null false|
|prefectures|string|null false|
|city|string|null false|
|number|string|null false|
|building|string|null false|
|phone|string|unique true|
|user_id|integer|null false, foreign_key true|

### Association
- belongs_to :user

## items table
|Column|Type|Options|
|------|----|-------|
|name|string|null false|
|explain|text|null false|
|delivery_cost_id|integer|null false|
|area_id|integer|null false|
|limit_id|integer|null false|
|status_id|integer|null false|
|price|integer|null false|
|user_id|integer|null false,foreign_key true|
|category_id|integer|null false, foreign_key true|
|brand|string|
|buyer_id|integer||

### Association
- belongs_to :user
- belongs_to :category
- has_many :images

## categories table
|Column|Type|Options|
|------|----|-------|
|name|string|null false|

### Association
- has_many :items

## images table
|Column|Type|Options|
|------|----|-------|
|name|text|null false|
|item_id|integer|null false, foreign_key true


### Association
- belongs_to :item
