class Item < ApplicationRecord
  belongs_to :user
   has_one :buy
   has_one_attached :image

   with_options presence: true do

     validates :title 
     validates :price 
     validates :description
     validates :category_id
     validates :status_id
     validates :burden_id
     validates :prefectures_id
     validates :daystoship_id
  end
end
