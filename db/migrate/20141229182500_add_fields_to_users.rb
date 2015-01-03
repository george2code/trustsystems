class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :avatar, :string

    add_column :users, :verified, :boolean
    add_column :users, :country_id, :integer
    add_column :users, :city_id, :integer
    add_column :users, :birth_date, :date
    add_column :users, :about, :text
  end
end