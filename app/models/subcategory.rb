class Subcategory < ActiveRecord::Base

  belongs_to :root_category
  has_many  :company_categories
  has_many  :companies, through: :company_categories
end