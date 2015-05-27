class BusinessController < ApplicationController
  layout 'business'


  def index
  end


  def signup
    if request.post?
      #handle posts
      @user = User.new(user_params)
      @user.role = 1  # client

      # check if company already exists
      company_name = params[:user][:company_name]

      if !company_name.nil? && Company.where(:name=>company_name).blank? && @user.save
        @company = Company.new
        @company.name = company_name
        @company.slug = company_name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
        @company.home_site = params[:user][:website]
        @company.email = params[:user][:email]
        @company.save

        UserCompany.create(:user_id => @user.id, :company_id => @company.id)

        flash[:notice] = 'You have signed up successfully. If enabled, a confirmation was sent to your e-mail.'
        sign_in @user
        redirect_to business_path
      else
        flash[:danger] = 'Заполните пустые поля. Также, компания с таким названием может быть уже зарегестрирована.'
        render :action => :signup
      end

    else
      #handle gets
      @user = User.new
    end
  end


  def login
    if request.post?
      #handle posts
      email = params[:user][:email]
      password = params[:user][:password]

      if email.nil? || email.empty?
        flash[:danger] = 'Email cannot be blank. Please fill in all fields!'
        render :action => :login
      elsif password.nil? || password.empty?
        flash[:danger] = 'Password cannot be blank. Please fill in all fields!'
        render :action => :login
      else
        user = User.find_by(email: email)
        if user.nil? == false && user.role == 1
          if BCrypt::Password.new(user.encrypted_password).is_password? password
            session[:user_id] = user.id
            sign_in user
              redirect_to business_path
          else
            flash[:danger] = 'User not exists! Please try again with different credentials'
            render :action => :login
          end
        else
          flash[:error] = 'There was an error logging in. Please check your email and password. And make sure that you role is Client.'
          render :action => :login
        end
      end
    end
  end


  def why_us
  end


  def pricing
  end


  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation,
                                 :company_name,
                                 :first_name, :last_name, :website, :phone, :country)
  end
end