# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :targets
- has_many :reviews
- has_many :comments

## targets テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| text     | content    | null: false                    |
| datetime | start_time | null: false                    |
| user     | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many :comments

## reviews テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| title       | string     | null: false                    |
| text        | content    | null: false                    |
| achievement | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

- belongs_to :user

## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| target | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :target