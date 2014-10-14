class FixThePriceForReal < ActiveRecord::Migration
  def change
    remove_column :prices, :price
    add_column :prices, :price, :decimal
  end
end
