class BusinessController < ApplicationController
  layout 'business'


  def index
  end


  def signup
    if request.post?
      #handle posts
      @user = User.new(user_params)
      @user.role = 1  # client

      if @user.save
         flash[:notice] = 'You have signed up successfully. If enabled, a confirmation was sent to your e-mail.'
         sign_in @user
         redirect_to business_path
      else
        render :action => :signup
      end
    else
      #handle gets
      @user = User.new
    end
  end


  def login

  end


  def why_us
  end

  def pricing
  end


  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation,
                                 :first_name, :last_name, :website, :phone, :country)
  end
end