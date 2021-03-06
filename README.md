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

- has_many :items
- has_many :item_purchases



## items テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| text               | string | null: false |
| price              | integer | null: false |
| condition_id       | integer | null: false |
| shipping_fee_id    | integer | null: false |
| prefecture_id      | integer | null: false |
| shipping_days_id   | integer | null: false |
| category_id        | integer | null: false |
| user_id            | integer | null: false, foreign_key: true |

### Association


- belongs_to :user
- has_one :item_purchases
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :category_id
- belongs_to_active_hash :brands
- belongs_to_active_hash :shipping_fee_id
- belongs_to_active_hash :shipping_days_id
- belongs_to_active_hash :condition_id

## destination テーブル

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| post_code             | string  | null: false |
| city                  | string  | null: false |
| address               | string  | null: false |
| building_name         | string  |             |
| phone_number          | string  | null: false |
| prefecture_id         | integer | null: false |
| item_purchases_id  | integer | null: false, foreign_key: true |

### Association

- belongs_to :item_purchase



## item_purchases テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| user_id            | integer | null: false, foreign_key: true |
| product_id         | integer | null: false, foreign_key: true |

-belongs_to :user
-belongs_to :item
-has_one :destination