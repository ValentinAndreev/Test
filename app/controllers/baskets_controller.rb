class BasketsController < ApplicationController
  before_action :find_basket

  def show
    @all_items = User.admins_basket
    @price = @basket.total_price
  end

  def edit; end

  def update
    if @basket.update(basket_params)
      redirect_to @basket
    else
      render 'edit'
    end
  end

  def destroy
    @basket.destroy
    redirect_to 'root'
  end

  private

  def find_basket
    @basket = current_user.basket
  end

  def basket_params
    params.permit(:price, :title)
  end  
end