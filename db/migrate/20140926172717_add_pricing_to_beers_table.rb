class AddPricingToBeersTable < ActiveRecord::Migration
  def up
    add_column :beers, :pricing, :string
  end

  def down
    remove_column :beers, :pricing
  end
end
