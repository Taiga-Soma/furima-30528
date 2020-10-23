# READEME

## users テーブル

| Colum           | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| firstname       | string | null: false |
| lastname        | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birthday        | date	 | null: false |

### Association
  has_many :comments
  has_many :buys
  has_many :items

## items テーブル

| Colum           | Type          | Options                        |
| --------------- | ------------- | -------------------------------|
| title           | string        | null: false                    |
| price           | integer        | null: false                    |
| description     | text          | null: false                    |
| category_id     | integer       | null: false                    |
| status_id       | integer       | null: false                    |
| burden_id       | integer       | null: false                    |
| prefectures_id | integer       | null: false                     |
| daystoship_id   | integer       | null: false                    |
| user            | references    | null: false, foreign_key: true |
   

   ### Association
   belongs_to :user
   has_one :order

## comments テーブル

| Colum | Type       | Options                        |
| ----- | ---------- | -------------------------------|
| text  | text       | null: false                    |
| user  | references | null: false, foreign_key: true |
| item  | references | null: false, foreign_key: true |


  ### Association
  belongs_to :user
  belongs_to :item

## order テーブル

| Colum | Type       | Options                        |
| ----- | ---------- | -------------------------------|
| user  | references | null: false, foreign_key: true |
| item  | references | null: false, foreign_key: true |


  ### Association
  belongs_to :user
  belongs_to :item
  has_one :address

## address テーブル

| Colum          | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_id        | string     | null: false                    |
| prefectures_id | integer    | null: false                    |
| city           | string     | null: false                    |
| address        | string     | null: false                    |
| buildingname   | string     |                                |
| tel            | string     | null: false                    |
| order          | references | null: false, foreign_key: true |

  ### Association
  belongs_to :order
