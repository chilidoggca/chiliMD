class AddProfileImageToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :user, foreign_key: true
    add_column :users, :profile_image_id, :string
    add_column :users, :profile_image_filename, :string
    add_column :users, :profile_image_size, :string
    add_column :users, :profile_image_content_type, :string
  end
end
