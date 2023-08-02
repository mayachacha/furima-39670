# テーブル設計

## users テーブル

| Column              | Type   ¥ | Options     |
| ------------------  | ------  | ----------- |
| nickname            | string  | null: false |
| email               | string  | null: false |
| encrypted_password  | string  | null: false |
| user_name           | string  | null: false |
| birthday            | integer | null: false |

### Association

- has_many :items
- has_many :purchase


## items テーブル

| Column          | Type     | Options     |
| ------          | -------  | ----------- |
| image           | string   | null: false |
| item_name       | string   | null: false |
| description     | text     | null: false |
| category        | string   | null: false |
| condition       | string   | null: false |
| shipping_fee    | integer  | null: false |
| shipping_from   | string   | null: false |
| until_shipping  | integer  | null: false |
| price           | integer  | null: false |


### Association

- belongs_to :purchase
- belongs_to :users


## purchase テーブル

| Column  | Type       | Options      |
| ------  | ---------- | ------------ |
| address | string     | null: false, |

###Association

- has_one :items
- belongs_to :users