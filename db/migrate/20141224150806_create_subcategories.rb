class CreateSubcategories < ActiveRecord::Migration
  def change
    create_table :subcategories do |t|
      t.integer :rootCategoryId
      t.string :name,       null: false
      t.text :description
      t.string :slug,       null: false

      t.timestamps
    end
  end
end
