# README

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nick_name          | string | null: false |
| email              | string | unique: true|
| encrypted_password | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birth_day          | date   | null: false |

### Association

- has_many :products
- has_many :item_purchases

## purchasers テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user_id            | integer    | null: false,foreign_key: true  |
| family_name        | string     | null: false                    |
| first_name         | string     | null: false                    |
| family_name_kana   | string     | null: false                    |
| first_name_kana    | string     | null: false                    |
| post_code          | string     | null: false                    |
| prefecture         | string     | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |
| item_purchase      | integer    | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :item_purchase

## item_purchases テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | integer    | null: false, foreign_key: true |
| product            | integer    | null: false, foreign_key: true |
| purchase_info      | integer    | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- belongs_to :purchaser

## products テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| price              | integer    | null: false                    |
| description        | text       | null: false                    |
| status             | string     | null: false                    |
| size               | string     | null: false                    |
| cost               | string     | null: false                    |
| days               | string     | null: false                    |
| prefecture         | string     | null: false                    |
| category           | references | null: false, foreign_key: true |
| brand              | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :item_purchase