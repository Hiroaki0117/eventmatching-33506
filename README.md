# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| family_name        | string  | null: false               |
| first_name         | string  | null: false               |
| kana_family_name   | string  | null: false               |
| kana_first_name    | string  | null: false               |
| birth_day          | date    | null: false               |
| area_id            | integer | null: false               |
| phone_number       | string  | null: false               |
| introduction       | string  |                           |

### Association
- has_many :events
- has_many :entries


## events テーブル
| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| name               | string  | null: false               |
| explanation        | text    | null: false               |
| genre_id           | string  | null: false               |
| day                | date    | null: false               |
| time_id            | integer | null: false               |
| capacity           | string  | null: false               |
| area_id            | integer | null: false               |
| place              | string  | null: false               |

### Association
- belongs_to :user
- has_many :entries

## entries テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| event         | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :event





