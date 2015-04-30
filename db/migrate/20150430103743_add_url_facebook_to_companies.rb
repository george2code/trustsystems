class AddUrlFacebookToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :url_facebook, :string
  end
end
