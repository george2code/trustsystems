class CreateReviewComments < ActiveRecord::Migration
  def change
    create_table :review_comments do |t|
      t.belongs_to :review,   index: true
      t.integer :user_id
      t.text :comment,        null: false

      t.timestamps
    end
  end
end
