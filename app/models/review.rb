class Review < ActiveRecord::Base
  belongs_to  :company, :dependent => :destroy
  belongs_to  :user, :dependent => :destroy
  has_many    :review_comments

  validates :review_short, presence: true
  validates :review_full, presence: true
  validates_format_of :rating, :without => /\A[0]*\Z/i
end