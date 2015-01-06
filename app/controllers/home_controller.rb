class HomeController < ApplicationController
  # before_filter :authenticate_user!
  ## if you want spesific action for require authentication
  ## before_filter :authenticate_user!, :only => [:action1, :action2]

  respond_to :html, :js
  include HomeHelper


  def index
    @latest_reviews = Review.limit(4).order('RANDOM()')

    #TODO Get review of the day. Don't know how to check it
    @day_review = Review.order('RANDOM()').first

    # Top 10 categories
    @top_categories = Subcategory.limit(8).order('RANDOM()')
  end


  def categorylist
    @root_categories = RootCategory.all
  end


  def categoryview
    @root_categories = RootCategory.all
    @category = RootCategory.find_by_slug(params[:id])

    if @category
        @companies = Array.new
        @category.subcategories.each do |subcategory|
          subcategory.companies.each do |company|
            @companies.push(company)
          end
        end
    else
      @category = Subcategory.find_by_slug(params[:id])
      @companies = @category.companies
    end

  end


  def user
    if (params[:id])
      @user = User.find(params[:id])
      @user_reviews = Review.where(:user_id => @user.id)
    end
  end


  #Ajax GET
  def top_categories

    category_id = params[:categoryId]

    #TODO: Check if category_id not NULL
    arr = Array.new
    content = ''

    # Best categories
    best_categories = top_companies_by_category(category_id, true)
    index = 1
    best_categories.each do |key, value|
      content += '<tr>'
      content += "<td>#{index}</td>"
      content += "<td><a href='companies/#{key.slug}'>#{key.name}</a></td>"
      content += "<td class='mark'>#{value}</td>"
      content += '<tr>'
      index += 1
    end
    arr.push(content)


    # Worst categories
    content = ''
    worst_categories = top_companies_by_category(category_id, false)
    index = 1
    worst_categories.each do |key, value|
      content += '<tr>'
      content += "<td>#{index}</td>"
      content += "<td><a href='companies/#{key.slug}'>#{key.name}</a></td>"
      content += "<td class='mark'>#{value}</td>"
      content += '<tr>'
      index += 1
    end
    arr.push(content)


    # Return JSON array
    render :json => arr.to_json
  end
end