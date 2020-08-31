# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| name                 | string | null: false |
| email                | string | null: false |
| password             | string | null: false |
| family_name          | string | null: false |
| first_name           | string | null: false |
| family_name_kana     | string | null: false |
| first_name_kana      | string | null: false |
| birthday             | date   | null: false |

### Association

- has_many :products
- belongs_to :destination
- belongs_to :credit_card


## products テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| product_name       | string | null: false |
| product_text       | string | null: false |
| condition_id       | string | null: false |
| shipping_fee_id    | string | null: false |
| prefecture_id      | string | null: false |
| shipping_days_id   | string | null: false |
| price              | string | null: false |
| user_id            | integer | null: false |
| brand_id           | integer | null: false |
| category_id        | integer | null: false |

### Association

- has_many :images
- has_many :comments
- belongs_to :users
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :categories
- belongs_to_active_hash :brands
- belongs_to_active_hash :shipping_fee_id
- belongs_to_active_hash :shipping_days_id
- belongs_to_active_hash :condition_id

## destination テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| post_code          | string  | null: false |
| prefecture_id      | string  | null: false |
| city               | string  | null: false |
| address            | string  | null: false |
| building_name      | string  |             |
| phone_number       | string  | null: false |
| user_id            | integer | null: false, foreign_key: true |

### Association

- belongs_to :users

## credit_card テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| card_number       | string  | null: false |
| months            | string  | null: false |
| year              | string  | null: false |
| security_code     | string  | null: false |
| user_id           | integer | null: false, foreign_key: true |

### Association

- belongs_to :users

## images テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| image           | string | null: false |
| product_id      | integer | null: false, foreign_key: true |

### Association

- belongs_to :products

## comments テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| text         | string | null: false |
| product_id   | integer | null: false, foreign_key: true |
| user_id      | integer | null: false, foreign_key: true |

### Association

- belongs_to :products