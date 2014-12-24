class HomeController < ApplicationController
  # before_filter :authenticate_user!
  ## if you want spesific action for require authentication
  ## before_filter :authenticate_user!, :only => [:action1, :action2]

  def index

  end


  def categorylist
    @root_categories = RootCategory.all
  end
end