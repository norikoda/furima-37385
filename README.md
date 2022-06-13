# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false, unique: true|
| email              | string | null: false, unique: true|
| encrypted_password | string | null: false, unique: true|
| last_name          | string | null: false              |
| first_name         | text   | null: false              |
| last_name_katakana | text   | null: false              |
| first_name_katakana| text   | null: false              |
| birthday           | date   | null: false              |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column        | Type       | Options                       |
| --------------| ---------- | ----------------------------- |
| user          | references | null: false, foreign_key: true|
| item_name     | string     | null: false,                  |
| description   | text       | null: false,                  |
| category      | string     | null: false,                  |
| item_status   | string     | null: false,                  |
| shipping_cost | string     | null: false,                  |
| shipping_date | string     | null: false,                  |
| price         | string     | null: false,                  |
### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :item
- has_one :pays

## pays テーブル

| Column       | Type       | Options                       |
| ------------ | --------   | ----------------------------  |
| orders       | references |null: false, foreign_key: true |
| postcode     | string     |null: false                    |
| prefecture   | intege     |null: false                    |
| city         | string     |null: false                    |
| block        | string     |null: false                    |
| building     | string     |null: false                    |
| phone_number | string     |                               |

### Association

- belongs_to :user
- has_one :pays
