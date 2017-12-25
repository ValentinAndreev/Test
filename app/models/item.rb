class Item < ApplicationRecord
  belongs_to :basket
  validate :items_number
  validates :price, numericality: true

  def items_number
    if basket.items.count > 9 && basket.user.role == 'user'
      errors.add(:message, "To many items in basket")
    end
  end
end
