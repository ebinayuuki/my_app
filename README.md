# テーブル設計

## doctors テーブル

| Column              | Type    | Options                   |
| ------------------- | --------| ------------------------- |
| email               | string  | null: false               |
| encrypted_password  | string  | null: false               |
| name                | string  | null: false               |
| age                 | integer | null: false               |
| gender              | string  | null: false               |
| postal              | integer | null: false               |
| ken_id              | integer | null: false               |
| phone               | integer | null: false               |
| specialty           | string  | null: false               |
| license             | integer | null: false               |
| info                | text    |                           |

### Association

- has_many :hospitals


## users テーブル

| Column              | Type    | Options                   |
| ------------------- | --------| ------------------------- |
| email               | string  | null: false               |
| encrypted_password  | string  | null: false               |
| name                | string  | null: false               |
| age                 | integer | null: false               |
| gender              | string  | null: false               |
| postal              | integer | null: false               |
| ken_id              | integer | null: false               |
| phone               | integer | null: false               |
| info                | text    |                           |

### Association

- has_many :reservations


## hospitals テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| department  | string     | null: false                    |
| postal      | integer    | null: false                    |
| ken_id      | integer    | null: false                    |
| info        | text       | null: false                    |
| time        | string     | null: false                    |
| doctor      | references | null: false, foreign_key: true |


### Association

- belongs_to :doctor
- has_many :reservations


## reservations テーブル


| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | string     | null: false, foreign_key: true |
| hospital           | integer    | null: false, foreign_key: true |


### Association

- belongs_to : hospitals
- belongs_to : users
