class HomeController < ApplicationController
  def index
    @basket = current_user.basket
  end
end
