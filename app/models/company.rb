class Company < ActiveRecord::Base
  has_many :reviews
  has_many :company_categories
  has_many :subcategories,  through: :company_categories
  has_many  :user_companies

  validates_presence_of :name, :slug, :home_site
  validates :email, :uniqueness => true


  # image upload rules
  has_attached_file :logos, :styles => { :medium => "160x160>" },
                    :default_url => "/images/missing/:style.png",
                    :url => "/images/company/:attachment/:id_:style.:extension"
  validates_attachment_content_type :logos, :content_type => /\Aimage\/.*\Z/

  has_attached_file :guarantee, :styles => { :medium => "200x100>" },
                    :default_url => "/images/missing/:style.png",
                    :url => "/images/company/:attachment/:id_:style.:extension"
  validates_attachment_content_type :guarantee, :content_type => /\Aimage\/.*\Z/

  has_attached_file :promotion, :styles => { :medium => "200x100>" },
                    :default_url => "/images/missing/:style.png",
                    :url => "/images/company/:attachment/:id_:style.:extension"
  validates_attachment_content_type :promotion, :content_type => /\Aimage\/.*\Z/
end