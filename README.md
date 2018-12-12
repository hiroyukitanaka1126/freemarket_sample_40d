# users table

|column|type|options|
|------|----|-------|
|family_name|string||
|first_name|string||
|nickname|string|null: false, unique: true|
|email|string|null:false, unique: true|
|password|integer|null: false, unique: true|
|card_number|integer|null: false, unique: true|
|phone_number|integer|null: false, unique: true|
|address|integer|null: false||

## Association
- has_many :items
- has_many :favorites


# items table

|column|type|options|
|------|----|-------|
|name|string|null: false|
|image|string|null: false|
|description|text|null: false|
|price|integer|null: false|
|seller_id|integer|null: false
|buyer_id|integer|null: false|
|shipping_cost|integer||
|shipping_date|integer||
|category_id|integer|references: category, foreign_key: true, null: false|
|genre_id|integer|references: genre, foreign_key: true|
|detail_id|integer|references: detail, foreign_key: true|

## Association
- belongs_to :user
- belongs_to :seller, class_name: "User"
- belongs_to :buyer, class_name: "User"
- has_many :favorites

# categories table

|column|type|options|
|------|----|-------|

## Association

# genres table

|column|type|options|
|------|----|-------|

## Association

# details table

|column|type|options|
|------|----|-------|

## Association

# favorites table

|column|type|options|
|------|----|-------|
|user_id|integer|references: user, foreign_key: true|
|item_id|integer|references: item, foreign_key: true|

## Association
- belongs_to :user
- belongs_to :item

--------------------------
<<<<<<< HEAD

=======
>>>>>>> master
