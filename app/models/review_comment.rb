class ReviewComment < ActiveRecord::Base
  belongs_to  :review, :dependent => :destroy
end
