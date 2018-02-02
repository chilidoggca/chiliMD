class CreateMedia < ActiveRecord::Migration[5.1]
  def change
    create_table :media do |t|
      t.string :title
      t.text :description
      t.references :user, foreign_key: true
      t.string :attachment_file_id
      t.string :attachment_file_filename
      t.string :attachment_file_content_type
      t.string :attachment_file_size

      t.timestamps
    end
  end
end
