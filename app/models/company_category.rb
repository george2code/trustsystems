class CompanyCategory < ActiveRecord::Base
  belongs_to :subcategory
  belongs_to :company
end