class ItemOrder < ApplicationRecord

  belongs_to :item
  belongs_to :user, optional: true
  belongs_to :item
  has_one :address

end
