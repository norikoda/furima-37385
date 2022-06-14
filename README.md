# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false,             |
| email              | string | null: false, unique: true|
| encrypted_password | string | null: false,             |
| last_name          | string | null: false              |
| first_name         | string | null: false              |
| last_name_katakana | string | null: false              |
| first_name_katakana| string | null: false              |
| birthday           | date   | null: false              |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column          | Type       | Options                       |
| ----------------| ---------- | ----------------------------- |
| user            | references | null: false, foreign_key: true|
| item_name       | string     | null: false,                  |
| description     | text       | null: false,                  |
| category_id     | string     | null: false,                  |
| item_status_id  | string     | null: false,                  |
| prefecture_id   | string     | null: false,                  |
| shipping_cost_id| string     | null: false,                  |
| shipping_date_id| string     | null: false,                  |
| price           | integer    | null: false,                  |
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
- belongs_to :item
- has_one :pay

## pays テーブル

| Column        | Type       | Options                       |
| ------------- | --------   | ----------------------------  |
| order         | references |null: false, foreign_key: true |
| postcode      | string     |null: false                    |
| prefecture_id | integer    |null: false                    |
| city          | string     |null: false                    |
| block         | string     |null: false                    |
| building      | string     |null: false                    |
| phone_number  | string     |null: false                    |

### Association

- belongs ro :pay
