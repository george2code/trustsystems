class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name,       null: false
      t.text :description
      t.string :home_site
      t.string :slug,       null: false
      t.integer :country_id
      t.integer :city_id
      t.string :zip
      t.string :email,      null: false
      t.string :phone
      t.text :address
      t.string :logo

      t.timestamps
    end
  end
end