class Basket < ApplicationRecord
  belongs_to :user
  has_many :items

  def total_price
    items.sum(:price).round(2)
  end
end
