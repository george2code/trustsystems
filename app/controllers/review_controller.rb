class ReviewController < ApplicationController
  def index
    # @reviews = Review.all
    @reviews = Review.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews.paginate(:page => params[:page], :per_page => 5)
  end
end