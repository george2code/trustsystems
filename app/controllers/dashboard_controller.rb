class DashboardController < ApplicationController
  layout 'dashboard'

  def index
  end

  def modules
  end

  def reviews
    @reviews = Review.limit(4).order('RANDOM()')
  end


  #modules
  def email_template

  end
end
