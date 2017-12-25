class BasketPriceToFloat < ActiveRecord::Migration[5.1]
  def change
    remove_column :baskets, :total_price
  end
end
