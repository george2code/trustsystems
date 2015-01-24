class ReviewController < ApplicationController
  def index
    # @reviews = Review.all
    @reviews = Review.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews.paginate(:page => params[:page], :per_page => 5)
  end

  def rate
    @company = Company.first


    if request.post?
      #handle posts
      @review = Review.new(review_params)

      # t.belongs_to :user,       index: true
      # t.belongs_to :company,    index: true
      # t.integer :rating
      # t.string :order_id
      # t.string :review_short,   null: false
      # t.text :review_full,      null: false
      # t.boolean :is_confirmed


      @review.user_id = current_user.id
      @review.company_id = @company.id
      @review.is_confirmed = false


      if @review.save
        flash[:success] = "Added review item."
        redirect_to reviews_path
      else
        # flash[:error] = "There was a problem adding that review item."
        render action: :rate
      end
    else
      #handle gets
      @review = Review.new
      @review.rating = 0
    end
  end


  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def review_params
    params.require(:review).permit(:rating, :order_id, :review_short, :review_full)
  end

end