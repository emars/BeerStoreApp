class AddBeerIdToContainerTable < ActiveRecord::Migration
  def up
    add_column :containers, :beer_id, :integer 
  end

  def down
    remove_column :containers, :beer_id
  end
end
