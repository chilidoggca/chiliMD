class AddPostReferencesToMedia < ActiveRecord::Migration[5.1]
  def change
    add_reference :media, :post, foreign_key: true
  end
end
