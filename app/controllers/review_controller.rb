class ReviewController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews
  end
end