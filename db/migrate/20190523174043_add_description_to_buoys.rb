class AddDescriptionToBuoys < ActiveRecord::Migration[5.2]
  def change
    add_column  :buoys, :description, :text
  end
end
