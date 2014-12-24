class Subcategory < ActiveRecord::Base
  belongs_to :root_category
end
