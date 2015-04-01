class Afs < ActiveRecord::Base
  belongs_to  :user, :dependent => :destroy
  belongs_to  :email_template

  validates :email_delay, presence: true
  validates :email_subject, presence: true
  validates :email_template_text, presence: true
  # validates :email_template_text, presence: true
end
