class ReviewUsefull < ActiveRecord::Base
  belongs_to  :review,  dependent: destroy
end
