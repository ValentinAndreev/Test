class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :basket, dependent: :destroy

  after_create :create_basket

  def self.admins_basket
    find_by(role: 'admin').basket.items.all
  end

  def items_count
    basket.items.count
  end

  private

  def self.create_basket
    Basket.create!(user: current_user)
  end
end
