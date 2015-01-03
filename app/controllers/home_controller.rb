class HomeController < ApplicationController
  # before_filter :authenticate_user!
  ## if you want spesific action for require authentication
  ## before_filter :authenticate_user!, :only => [:action1, :action2]

  def index
    @latest_reviews = Review.limit(5).order('RANDOM()')
  end

  def categorylist
    @root_categories = RootCategory.all
  end

  def user
    if (params[:id])
      @user = User.find(params[:id])
      @user_reviews = Review.where(:user_id => @user.id)
    end
  end
end