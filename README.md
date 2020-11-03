# DB設計

## users table

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| first_name      | string  | null: false |
| last_name       | string  | null: false |
| first_name_kana | string  | null: false |
| last_name_kana  | string  | null: false |
| birthday_year   | integer | null: false |
| birthday_month  | integer | null: false |
| birthday_day    | integer | null: false |

### Association
_ has_many   :items
_ belongs_to :order

## items table

| Column        | Type         | Options                        |
| ------------- | ------------ | ------------------------------ |
| image         | ActiveRecord | null: false                    |
| explanation   | text         | null: false                    |
| name          | string       | null: false                    |
| category      | string       | null: false                    |
| status        | string       | null: false                    |
| shipping      | string       | null: false                    |
| delivery_area | string       | null: false                    |
| delivery_days | string       | null: false                    |
| price         | integer      | null: false                    |
| user_id       | references   | null: false, foreign_key: true |

### Association
_ belongs_to  :user
_ has_one     :order

## orders table

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefectures    | string     | null: false                    |
| municipalities | string     | null: false                    |
| address        | string     | null: false                    |
| building_name  | string     | null: false                    |
| phone_number   | integer    | null: false                    |
| user_id        | references | null: false, foreign_key: true |
| item_id        | references | null: false, foreign_key: true |

### Association
_ belongs_to :user
_ belongs_to :item