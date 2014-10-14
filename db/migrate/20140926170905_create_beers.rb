class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.string :header
      t.string :category
      t.string :brewer
      t.string :alc
      t.string :description
      t.string :tags

      t.timestamps
    end
  end
end
