# テーブル設計

## Users テーブル

| Column              | Type    | Options     |
| ------------------  | ------  | ----------- |
| nickname            | string  | null: false |
| email               | string  | null: false |
| encrypted_password  | string  | null: false |
| last_name           | string  | null: false |
| first_name          | string  | null: false |
| last_name_kana      | string  | null: false |
| first_name_kana     | string  | null: false |
| birthday            | date    | null: false |
| address             | references | foreign_key: true |
| order               | references | foreign_key: true |

### Association

- has_many :items
- has_many :addresses
- has_many :orders


## Items テーブル

| Column           | Type     | Options     |
| ------           | -------  | ----------- |
| item_name        | string   | null: false |
| description      | text     | null: false |
| category_id      | string   | null: false |
| condition_id     | string   | null: false |
| shipping_fee_id  | integer  | null: false |
| shipping_from_id | string   | null: false |
| days_to_ship_id  | integer  | null: false |
| price            | integer  | null: false |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user


## Address テーブル

| Column         | Type       | Options      |
| ------         | ---------- | ------------ |
| postcode       | string     | null: false, |
| prefecture     | string     | null: false, |
| city           | string     | null: false, |
| street_address | string     | null: false, |
| building       | string     | null: false, |
| phone_number   | string     | null: false, |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :orders


## Orders テーブル
| Column     | Type       | Options      |
| ------     | ---------- | ------------ |
| user       | references | null: false, foreign_key: true |
| address    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :address