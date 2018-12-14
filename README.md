# users table
|column|type|options|
|------|----|-------|
|nickname|string|null: false|
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



# municipalities table
|column|type|options|
|------|----|-------|
|name|string|null: false|
|address|string|null: false|
|building|string||

## Association


# prefectures table
|column|type|options|
|------|----|-------|
|name|string|null: false|
|municipality_id|integer|null: false|

## Association

# sale_proceeds table
|column|type|options|
|------|----|-------|
|sale_proceed|integer||

## Association

# points table
|column|type|options|
|------|----|-------|
|point|integer||


# likes table
|column|type|options|
|------|----|-------|
|user_id|integer|null: false|
|item_id|integer|null: false|

## Association

# items table
|column|type|options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|price|string|null: false|
|category_id|integer|null: false|
|brand_id|integer|null: false|
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

## Association

# images table
|column|type|options|
|------|----|-------|
|item_id|integer|null: false|

# delivery_fee table
|column|type|options|
|------|----|-------|
|||

## Association

# delivery_date table
|column|type|options|
|------|----|-------|
|date|string|null: false|

# delivery table
|column|type|options|
|------|----|-------|
|method|string|null: false|


# categories table

|column|type|options|
|------|----|-------|
|name|string|null: false|
|parent_id|integer|null: false|

## Association

# brands table
|column|type|options|
|------|----|-------|
|name|string||

## Association

# sizes table
|column|type|options|
|------|----|-------|
|size|string|null: false|

## Association

# statuses table
|column|type|options|
|------|----|-------|
|status|string|null: false|

## Association

# comments table
|column|type|options|
|------|----|-------|
|text|text||

