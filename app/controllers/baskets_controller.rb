class BasketsController < ApplicationController
  before_action :find_basket

  def show
    @all_items = User.all_items
    @price = @basket.total_price
  end

  private

  def find_basket
    @basket ||= current_user.basket
  end

  def basket_params
    params.permit(:price, :title)
  end
end
