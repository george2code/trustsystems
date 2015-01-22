class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :vkontakte]

  validates_presence_of :email

  has_many  :reviews
  has_many :authorizations


  def full_name
    first_name + ' ' + last_name
  end


  def self.new_with_session(params,session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end


  def self.from_omniauth(auth, current_user)
    authorization = Authorization.where(
        :provider => auth.provider,
        :uid => auth.uid.to_s,
        :token => auth.credentials.token,
        :secret => auth.credentials.secret).first_or_initialize

    if authorization.user.blank?
      user = current_user.nil? ?
          User.where('email = ?', auth["info"]["email"]).first :
          current_user

      if user.blank?
        user = User.new
        user.password = Devise.friendly_token[0,10]
        # user.name = auth.info.name
        user.first_name = auth.info.first_name
        user.last_name = auth.info.last_name
        user.avatar = auth.info.image
        user.email = auth.info.email
        auth.provider == 'twitter' ?  user.save(:validate => false) :  user.save

        # TODO: if user has no avatar, should I take it from social network?
      end
      # authorization.username = auth.info.nickname
      authorization.username = auth.info.email
      authorization.user_id = user.id
      authorization.save
    end
    authorization.user
  end

end