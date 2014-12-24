class RootCategoriesController < ApplicationController
  before_action :set_root_category, only: [:show, :edit, :update, :destroy]

  # GET /root_categories
  # GET /root_categories.json
  def index
    @root_categories = RootCategory.all
  end

  # GET /root_categories/1
  # GET /root_categories/1.json
  def show
  end

  # GET /root_categories/new
  def new
    @root_category = RootCategory.new
  end

  # GET /root_categories/1/edit
  def edit
  end

  # POST /root_categories
  # POST /root_categories.json
  def create
    @root_category = RootCategory.new(root_category_params)

    # @root_category.created_at = DateTime.now
    # @root_category.updated_at = DateTime.now

    respond_to do |format|
      if @root_category.save
        format.html { redirect_to @root_category, notice: 'Root category was successfully created.' }
        format.json { render :show, status: :created, location: @root_category }
      else
        format.html { render :new }
        format.json { render json: @root_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /root_categories/1
  # PATCH/PUT /root_categories/1.json
  def update
    respond_to do |format|
      if @root_category.update(root_category_params)
        format.html { redirect_to @root_category, notice: 'Root category was successfully updated.' }
        format.json { render :show, status: :ok, location: @root_category }
      else
        format.html { render :edit }
        format.json { render json: @root_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /root_categories/1
  # DELETE /root_categories/1.json
  def destroy
    @root_category.destroy
    respond_to do |format|
      format.html { redirect_to root_categories_url, notice: 'Root category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_root_category
      @root_category = RootCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def root_category_params
      params.require(:root_category).permit(:show, :index, :new, :edit, :list)
    end

    def root_category_params
      params.require(:root_category).permit(:name, :slug, :iconName)
    end
end
