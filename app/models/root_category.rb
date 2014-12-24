class RootCategory < ActiveRecord::Base
  has_many :subcategories

  def to_param
    extend FriendlyId
    friendly_id :slug
  end
end