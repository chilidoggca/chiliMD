class RemovePostReferencesFromReference < ActiveRecord::Migration[5.1]
  def change
    remove_reference :references, :post, foreign_key: true
  end
end
