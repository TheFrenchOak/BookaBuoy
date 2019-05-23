class CreateBuoys < ActiveRecord::Migration[5.2]
  def change
    create_table :buoys do |t|
      t.string :name
      t.string :photo
      t.string :color
      t.string :size
      t.string :category
      t.integer :price
      t.string :address
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
