class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :discription
      t.decimal :price, precision: 10, scale: 2
      t.boolean :available
      t.binary :image
      t.timestamps
    end
  end
end
