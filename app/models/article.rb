class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :status
  belongs_to_active_hash :burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :daystoship

  validates :title, :text, :genre, :status, :burden, :prefecture, :daystoship, presence: true

  validates :genre_id, :status_id, :burden_id, :prefecture_id, :daystoship_id, numericality: { other_than: 1 }
end
