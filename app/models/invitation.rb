class Invitation < ActiveRecord::Base
  belongs_to :user
  has_many :invitation_customerses
end
