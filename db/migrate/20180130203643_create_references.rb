class CreateReferences < ActiveRecord::Migration[5.1]
  def change
    create_table :references do |t|
      t.references :post, foreign_key: true
      t.string :body
      t.string :url
      t.string :doi

      t.timestamps
    end
  end
end
