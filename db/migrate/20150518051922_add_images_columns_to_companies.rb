class AddImagesColumnsToCompanies < ActiveRecord::Migration
  def change
    add_attachment :companies, :logos
    add_attachment :companies, :guarantee
    add_attachment :companies, :promotion
  end
end