class AddPositionToReviewlists < ActiveRecord::Migration[5.1]
  def change
    add_column :reviewlists, :position, :integer
  end
end
