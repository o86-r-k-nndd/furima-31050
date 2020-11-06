# DB設計

## users table
ユーザー管理機能

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| first_name         | string  | null: false               |
| last_name          | string  | null: false               |
| first_name_kana    | string  | null: false               |
| last_name_kana     | string  | null: false               |
| birthday           | date    | null: false               |


### Association
_ has_many :items
_ has_many :orders

## items table
商品出品機能

| Column           | Type         | Options                        |
| ---------------- | ------------ | ------------------------------ |
| explanation      | text         | null: false                    |
| name             | string       | null: false                    |
| category_id      | integer      | null: false                    |
| status_id        | integer      | null: false                    |
| shipping_id      | integer      | null: false                    |
| delivery_area_id | integer      | null: false                    |
| delivery_days_id | integer      | null: false                    |
| price            | integer      | null: false                    |
| user             | references   | null: false, foreign_key: true |

### Association
_ belongs_to           :user
_ has_one              :order

### Association ActiveStorage
_ has_one_attached     :image

### Association ActiveHash
belongs_to_active_hash :category
belongs_to_active_hash :status
belongs_to_active_hash :shipping
belongs_to_active_hash :delivery_area
belongs_to_active_hash :delivery_day


# orders table
購入者の情報

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association
_ belongs_to :user
_ belongs_to :item
_ has_one    :address

## addresses table
商品者住所情報

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| municipalities | string     | null: false                    |
| address        | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| prefectures_id | integer    | null: false                    |
| order          | references | null: false, foreign_key: true |


### Association
_ belongs_to :order