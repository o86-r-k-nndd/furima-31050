# DB設計

## users table
ユーザー管理機能

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| first_name         | string  | null: false |
| last_name          | string  | null: false |
| first_name_kana    | string  | null: false |
| last_name_kana     | string  | null: false |
| birthday           | date    | null: false |


### Association
_ has_many :items
_ has_many :order

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
_ belongs_to  :user
_ has_one     :order

## orders table
商品購入機能

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefectures    | string     | null: false                    |
| municipalities | string     | null: false                    |
| address        | string     | null: false                    |
| building_name  | string     | null: false                    |
| phone_number   | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association
_ belongs_to :user
_ belongs_to :item