# READEME

## users テーブル

| Colum    | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| name     | string | null: false |
| birthday | date	  | null: false |

### Association
  has_many :comments


## items テーブル
  
  belongs_to :user

| Colum        | Type          | Options                        |
| ------------ | ------------- | -------------------------------|
| title        | string        | null: false                    |
| description  | text          | null: false                    |
| category     | integer       | null: false                    |
| status       | integer       | null: false                    |
| burden       | integer       | null: false                    |
| shippingarea | integer       | null: false                    |
| daystoship   | integer       | null: false                    |
| image        | ActiveStorage |  |                             
| user         | references    | null: false, foreign_key: true |
   

   ### Association
   belongs_to :user

## comments テーブル

| Colum | Type       | Options                        |
| ----- | ---------- | -------------------------------|
| text  | text       | null: false                    |
| user  | references | null: false, foreign_key: true |
| item  | references | null: false, foreign_key: true |


  ### Association
  belongs_to :user
  belongs_to :item

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

  

| Colum        | Type    | Options     |
| ------------ | ------- | ------------|
| post         |  string | null: false |
| prefectures  | integer | null: false |
| city         |  text   | null: false |
| address      |  text   | null: false |
| buildingname |  text   |             |
| tel          |  text   | null: false |

  ### Association
  belongs_to :user
  belongs_to :item