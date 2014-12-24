class AddForeignKeyToSubcategories < ActiveRecord::Migration
  def change
    add_index :subcategories, :rootCategoryId
  end
end
