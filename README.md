# users table
|column|type|options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|integer|null: false, unique: true|
|phone_number|integer|null:false, unique: true|
|first_name|string|null: false|
|last_name|string|null: false|
|postal-code|integer|null: false|
|prefecture|string|null: false||
|birthday|integer|null: false|
|sale_proceed_id|integer||
|point_id|integer||
|payment_method|string|null: false|
|profile_text|text||

## Association
- has_many :prefectures
- has_many :sale_proceeds
- has_many :points


# municipalities table
|column|type|options|
|------|----|-------|
|name|string|null: false|
|address|string|null: false|
|building|string||

## Association
- belongs_to :prefecture


# prefectures table
|column|type|options|
|------|----|-------|
|name|string|null: false|
|municipality_id|integer|null: false|

## Association
- belongs_to :user
- belongs_to :item

# sale_proceeds table
|column|type|options|
|------|----|-------|
|sale_proceed|integer||

## Association
- belongs_to :user
- belongs_to :item

# points table
|column|type|options|
|------|----|-------|
|point|integer||

## Association
- belongs_to :user

# likes table
|column|type|options|
|------|----|-------|
|user_id|integer|null: false|
|item_id|integer|null: false|

## Association
- belongs_to :item, counter_cache: :likes_count
- belongs_to :user

# items table
|column|type|options|
|------|----|-------|
|name|string|null: false, index: true|
|description|text|null: false|
|price|string|null: false|
|category_id|integer|null: false, index: true|
|brand_id|integer|null: false, index: true|
|size_id|integer|null: false|
|status_id|integer|null: false|
|delivery_fee_id|integer|null: false|
|delivery_date_id|integer|null: false|
|derivery_id|integer|null: false|
|prefecture_id|integer|null: false|
|sale_proceeds|integer|null: false|
|comment_id|integer|null: false|
|buyer_id|integer|null: false|
|seller_id|integer|null: false|
|likes_count|integer||

## Association
- has_many :likes
- has_many :delivery_fee
- has_many :delivery_date
- has_many :delivery
- has_many :sale_proceeds
- has_many :prefectures
- has_many :categories
- has_many :brands
- has_many :sises
- has_many :states
- has_many :images
- belongs_to :seller, class_name: "User"
- belongs_to :buyer, class_name: "User"

# images table
|column|type|options|
|------|----|-------|
|item_id|integer|null: false|
- belongs_to :item

# delivery_fee table
|column|type|options|
|------|----|-------|
|||

## Association
- belongs_to :item

# delivery_date table
|column|type|options|
|------|----|-------|
|date|string|null: false|

## Association
- belongs_to :item

# delivery table
|column|type|options|
|------|----|-------|
|method|string|null: false|

## Association
- belongs_to :item


# categories table

|column|type|options|
|------|----|-------|
|name|string|null: false, index: true|
|parent_id|integer|null: false|

## Association
- belongs_to :item
- belongs_to :parent, class_name: :Category
- has_many :children, class_name: :Category, foreign_key: :parent_id

# brands table
|column|type|options|
|------|----|-------|
|name|string|index: true|

## Association
- belongs_to :item

# sizes table
|column|type|options|
|------|----|-------|
|size|string|null: false|

## Association
- belongs_to :item

# statuses table
|column|type|options|
|------|----|-------|
|status|string|null: false|

## Association
- belongs_to :item

# comments table
|column|type|options|
|------|----|-------|
|text|text||

## Association
- belongs_to :item
