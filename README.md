# users table
|column|type|options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|integer|null: false, unique: true|
|phone_number|integer|null:false, unique: true|
|first_name|string|null: false|
|last_name|string|null: false|
|postal_code|integer|null: false|
|birthday|date|null: false|
|payment_method|string|null: false|
|profile_text|text||

## Association
- has_many :prefectures
- has_many :sale_proceeds
- has_many :points
- has_many :comments
- has_many :deals, foreign_key: :seller_id
- has_many :deals_of_seller, class_name: "Deal", foreign_key: "seller_id"
- has_many :deals_of_buyer, class_name: "Deal", foreign_key: "buyer_id"


# municipalities table
|column|type|options|
|------|----|-------|
|name|string|null: false|
|address|string|null: false|
|building|string||
|prefecture_id|references :prefecture|foreign_key: true, null: false|

## Association
- belongs_to :prefecture


# prefectures table
|column|type|options|
|------|----|-------|
|name|integer :status|default: 0, null: false, limit: 46, index: true|
|user_id|references :user|foreign_key: true, null: false|
|item_id|references :item|foreign_key: true, null: false|

## Association
- belongs_to :user
- belongs_to :item
- has_many :municipalities

# sale_proceeds table
|column|type|options|
|------|----|-------|
|sale_proceed|integer||
|user_id|references :user|foreign_key: true, null: false|
|item_id|references :item|foreign_key: true, null: false|

## Association
- belongs_to :user
- belongs_to :item

# points table
|column|type|options|
|------|----|-------|
|point|integer||
|user_id|references :user|foreign_key: true, null: false|

## Association
- belongs_to :user

# likes table
|column|type|options|
|------|----|-------|
|user_id|references :user|foreign_key: true, null: false|
|item_id|references :item|foreign_key: true, null: false|

## Association
- belongs_to :item, counter_cache: :likes_count
- belongs_to :user

# items table
|column|type|options|
|------|----|-------|
|name|string|null: false, index: true|
|description|text|null: false|
|price|string|null: false|
|status|string|null: false|
|sale_proceed|references :sale_proceed|foreign_key: true, null: false|
|likes_count|integer||

## Association
- has_many :likes
- has_many :delivery_fees
- has_many :delivery_dates
- has_many :deliveries
- has_many :sale_proceeds
- has_many :prefectures
- has_many :categories
- has_many :brands
- has_many :sizes
- has_many :images
- has_many :deals
- has_many :sellers, through: :deals
- has_many :buyers, through: :deals
- has_many :deals_of_seller, class_name: "Deal", foreign_key: "seller_id"
- has_many :deals_of_buyer, class_name: "Deal", foreign_key: "buyer_id"
- has_many :items_of_seller, through: :deals_of_seller, source: "item"
- has_many :items_of_buyer, through: :deals_of_buyer, source: "item"
- belongs_to :seller, class_name: "User"
- belongs_to :buyer, class_name: "User"
- belongs_to :brand
- belongs_to :delivery

# deals table
|column|type|options|
|------|----|-------|
|item_id|references: item|foreign_key: true|
|seller_id|references: user|foreign_key: true|
|buyer_id|references: user|foreign_key: true|

## Association
- belongs_to :seller, class_name: "User"
- belongs_to :buyer, class_name: "User"
- belongs_to :item

# images table
|column|type|options|
|------|----|-------|
|item_id|references :item|foreign_key: true, null: false|

## Association
- belongs_to :item

# delivery_fees table
|column|type|options|
|------|----|-------|
|delivery_fee|integer||
|item_id|references :item|foreign_key: true, null: false|

## Association
- belongs_to :item

# delivery_dates table
|column|type|options|
|------|----|-------|
|date|string|null: false|
|item_id|references :item|foreign_key: true, null: false|

## Association
- belongs_to :item

# deliveries table
|column|type|options|
|------|----|-------|
|method|string|null: false|

## Association
- has_many :items


# categories table

|column|type|options|
|------|----|-------|
|name|string|null: false, index: true|
|parent_id|integer|null: false, foreign_key: true, index: true|
|item_id|references :item|null: false, foreign_key: true, index: true|

## Association
- belongs_to :item
- belongs_to :parent, class_name: :Category
- has_many :children, class_name: :Category, foreign_key: :parent_id

# brands table
|column|type|options|
|------|----|-------|
|name|string|index: true|

## Association
- has_many :items

# sizes table
|column|type|options|
|------|----|-------|
|size|string|null: false|
|item_id|references :item|foreign_key: true, null :false|

## Association
- belongs_to :item

# comments table
|column|type|options|
|------|----|-------|
|text|text||
|item_id|references :item|foreign_key: true, null: false|
|user_id|references :user|foreign_key: true, null: false|

## Association
- belongs_to :item
- belongs_to :user
