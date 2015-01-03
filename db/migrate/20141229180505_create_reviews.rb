class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.belongs_to :user,       index: true
      t.belongs_to :company,    index: true
      t.integer :rating
      t.string :order_id
      t.string :review_short,   null: false
      t.text :review_full,      null: false
      t.boolean :is_confirmed

      t.timestamps
    end
  end
end
