class FixSubcategoryColumnName < ActiveRecord::Migration
  def change
    rename_column :subcategories, :rootCategoryId, :root_category_id
  end
end
