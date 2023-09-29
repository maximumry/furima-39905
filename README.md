## テーブル設計

## users テーブル

|     Column      |   Type  |    Options  |
|-----------------|---------|-------------|
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| last_name       | string  | null: false |
| first_name      | string  | null: false |
| kana_last       | string  | null: false |
| kana_first      | string  | null: false |
| birth_day       | integer | null: false |

### Association

- has_many :items
- has_many :logs
- has_one :delivery

## items テーブル

|   Column      | Type       |   Options                      |
|---------------|------------|--------------------------------|
| name          | string     | null: false                    |
| text          | text       | null: false                    |
| category      | integer    | null: false                    |
| condition     | integer    | null: false                    |
| burden_info   | integer    | null: false                    |
| are_info      | integer    | null: false                    |
| shipping_days | integer    | null: false                    |
| price         | string     | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :delivery
- has_one :log

## deliveries テーブル

|    Column      |    Type    |         Options                |
|--------------------------------------------------------------|
| post_code      | string     | null: false                    |
| prefecture     | integer    | null: false                    |
| municipalities | string     | null: false                    |
| house_number   | string     | null: false                    |
| building_name  | string     | null: true                     |
| phone_number   | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :log

## logs テーブル

| Column   | Type       | Options                        |
|----------|------------|--------------------------------|
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |
| delivery | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :delivery