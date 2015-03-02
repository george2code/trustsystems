class DashboardController < ApplicationController
  layout 'dashboard'

  def index
    # @afs = Afs.new(afs_params)
  end

  def modules
  end

  def reviews
    @reviews = Review.limit(4).order('RANDOM()')
  end

  def statistics

  end


  #modules
  def email_template
    # @afs = Afs.new(afs_params)
    @afs = Afs.new
  end

  def categories
  end


  def user_management
  end


  #settings
  def notifications

  end

  def settings
    
  end


  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def afs_params
    params.require(:afs).permit(:email_delay, :email_subject, :email_template_text, :review_full)
  end
end