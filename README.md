# READEME

## users テーブル

| Colum           | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| firstname       | string | null: false |
| lastname        | string | null: false |
| firstname(ruby) | string | null: false |
| lastname(ruby)  | string | null: false |
| birthday        | date	 | null: false |

### Association
  has_many :comments
  has_many :buys
  has_many :items

## items テーブル
  
  belongs_to :user

| Colum           | Type          | Options                        |
| --------------- | ------------- | -------------------------------|
| title           | string        | null: false                    |
| description     | text          | null: false                    |
| category_id     | integer       | null: false                    |
| status_id       | integer       | null: false                    |
| burden_id       | integer       | null: false                    |
| shippingarea_id | integer       | null: false                    |
| daystoship_id   | integer       | null: false                    |                           
| user            | references    | null: false, foreign_key: true |
   

   ### Association
   belongs_to :user
   belongs_to :buys
## comments テーブル

| Colum | Type       | Options                        |
| ----- | ---------- | -------------------------------|
| text  | text       | null: false                    |
| user  | references | null: false, foreign_key: true |
| item  | references | null: false, foreign_key: true |


  ### Association
  belongs_to :user
  belongs_to :item
  has_one :address

## buys テーブル

| Colum | Type       | Options                        |
| ----- | ---------- | -------------------------------|
| curd  | integer    | null: false                    |
| user  | references | null: false, foreign_key: true |
| item  | references | null: false, foreign_key: true |


  ### Association
  belongs_to :user
  belongs_to :item

## address テーブル

| Colum          | Type    | Options     |
| -------------- | ------- | ------------|
| post_id        | string  | null: false |
| prefectures_id | integer | null: false |
| city           | string  | null: false |
| address        | string  | null: false |
| buildingname   | string  |             |
| tel            | string  | null: false |

  ### Association
  beongs_to :buys
