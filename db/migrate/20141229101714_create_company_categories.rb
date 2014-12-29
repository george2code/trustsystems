class CreateCompanyCategories < ActiveRecord::Migration
  def change
    drop_table :company_categories

    create_table :company_categories do |t|
      t.belongs_to :subcategory, index: true
      t.belongs_to :company, index: true
      t.timestamps
    end
  end
end
