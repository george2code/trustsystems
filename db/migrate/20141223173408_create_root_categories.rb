class CreateRootCategories < ActiveRecord::Migration
  def change
    create_table :root_categories do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.string :iconName

      t.timestamps
    end
  end
end
