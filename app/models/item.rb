class Item < ApplicationRecord
  has_one :buy
  has_one_attached :image
  belongs_to :user

  validates :title 
  validates :price 
  validates :description 
  validates :category_id
  validates :status_id
  validates :burden_id 
  validates :prefectures_id
  validates :daystoship_id

end
