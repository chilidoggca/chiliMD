class AddLocationAndDefaultImageToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :location, :string
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
    add_column :users, :default_image, :string
  end
end
