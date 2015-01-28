class FixUsersLocationColumns < ActiveRecord::Migration
  def change
    rename_column :users, :country_id, :country
    rename_column :users, :city_id, :city

    change_column :users, :country, :string
    change_column :users, :city, :string
  end
end
