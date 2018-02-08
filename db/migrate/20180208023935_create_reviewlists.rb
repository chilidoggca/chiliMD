class CreateReviewlists < ActiveRecord::Migration[5.1]
  def change
    create_table :reviewlists do |t|
      t.references :user, foreign_key: true, index: true
      t.references :reviewable, polymorphic: true, index: true
      t.datetime :start_date

      t.timestamps
    end
  end
end
