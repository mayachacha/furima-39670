# テーブル設計

## Users テーブル

| Column              | Type    | Options     |
| ------------------  | ------  | ----------- |
| nickname            | string  | null: false |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false |
| last_name           | string  | null: false |
| first_name          | string  | null: false |
| last_name_kana      | string  | null: false |
| first_name_kana     | string  | null: false |
| birthday            | date    | null: false |

### Association

- has_many :items
- has_many :orders


## Items テーブル

| Column           | Type     | Options     |
| ------           | -------  | ----------- |
| item_name        | string   | null: false |
| description      | text     | null: false |
| category_id      | integer  | null: false |
| condition_id     | integer  | null: false |
| shipping_fee_id  | integer  | null: false |
| prefecture_id    | integer  | null: false |
| day_to_ship_id   | integer  | null: false |
| price            | integer  | null: false |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order


## Addresses テーブル

| Column         | Type       | Options      |
| ------         | ---------- | ------------ |
| postcode       | string     | null: false, |
| prefecture_id  | integer    | null: false, |
| city           | string     | null: false, |
| street_address | string     | null: false, |
| building       | string     |              |
| phone_number   | string     | null: false, |
| order          | references | null: false, foreign_key: true |

### Association

- belongs_to :order


## Orders テーブル
| Column     | Type       | Options      |
| ------     | ---------- | ------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address