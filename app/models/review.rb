class Review < ActiveRecord::Base
  belongs_to  :company, :dependent => :destroy
  belongs_to  :user, :dependent => :destroy
  has_many    :review_comments
end
