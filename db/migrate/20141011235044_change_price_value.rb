class ChangePriceValue < ActiveRecord::Migration
  def change
    remove_column :prices, :price
    add_column :prices, :price, :integer
  end
end
