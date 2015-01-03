class CreateReviewUsefulls < ActiveRecord::Migration
  def change
    create_table :review_usefulls do |t|
      t.integer :user_id
      t.belongs_to :review,   index: true

      t.timestamps
    end
  end
end
