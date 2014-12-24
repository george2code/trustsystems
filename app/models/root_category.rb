class RootCategory < ActiveRecord::Base
  def to_param
    extend FriendlyId
    friendly_id :slug
  end
end
