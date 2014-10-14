class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.belongs_to :beer
      t.integer :volume
      t.integer :quantity
      t.string :container_type
      t.decimal :price

      t.timestamps
    end
  end
end
