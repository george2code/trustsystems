class Afs < ActiveRecord::Base
  belongs_to  :user, :dependent => :destroy
  belongs_to  :email_template
end
