class ItemsController < ApplicationController
  before_action :find_basket

  def create
    @item = @basket.items.new(item_params)
    @item.save
    error = @item.errors.messages[:message].first
    flash[:notice] = error if error
    redirect_to @basket
  end

  def destroy
    @item = @basket.items.find(params[:id])
    @item.destroy
    redirect_to @basket
  end

  private

  def find_basket
    @basket = current_user.basket
  end

  def item_params
    params[:item] ? params.permit(:item => [:title, :price])["item"] : params.permit(:title, :price)
  end
end
