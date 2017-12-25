module BasketsHelper
  def main_caption
    current_user.role == 'user' ? 'My basket' : 'On store'
  end

  def basket_caption
    current_user.role == 'user' ? 'basket' : 'store'
  end
end
