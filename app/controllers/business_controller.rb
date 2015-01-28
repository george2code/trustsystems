class BusinessController < ApplicationController
  layout 'business'


  def index
  end


  def signup

    # WorldFlags.flag_tag = :option

    if request.post?
      #handle posts
      @user = User.new(params[:user])
      # if @user.save
      #   flash[:notice] = 'You have signed up successfully. If enabled, a confirmation was sent to your e-mail.'
      #   redirect_to business_path
      # else
      #   render :action => :signup
      # end
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
end