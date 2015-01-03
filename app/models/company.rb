class Company < ActiveRecord::Base
  has_many :reviews
  has_many :company_categories
  has_many :subcategories,  through: :company_categories
end
