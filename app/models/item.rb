class Item < ApplicationRecord
  belongs_to :user
  has_one :buy
  has_one_attached :image, dependent: :destroy

  with_options presence: true do
    validates :title
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :description
    validates :category_id
    validates :status_id
    validates :burden_id
    validates :prefecture_id
    validates :daystoship_id
    validates :image
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :daystoship

  validates :category_id, :status_id, :burden_id, :prefecture_id, :daystoship_id, numericality: { other_than: 1 }
end
