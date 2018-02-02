class AddIsVideoAndIsImageToMedia < ActiveRecord::Migration[5.1]
  def change
    add_column :media, :is_video, :boolean, null: false, default: false
    add_column :media, :is_image, :boolean, null: false, default: false
  end
end
