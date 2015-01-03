class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @companies = Company.all
    respond_with(@companies)
  end

  def show
    respond_with(@company)
  end

  def new
    @company = Company.new
    respond_with(@company, @categories)
  end

  def edit
    @categories = Subcategory.all
  end

  def create
    @company = Company.new(company_params)
    @company.save
    respond_with(@company)
  end

  def update
    @company.update(company_params)
    respond_with(@company)
  end

  def destroy
    @company.destroy
    respond_with(@company)
  end

  private
    def set_company
      # @company = Company.find(params[:slug])
      @company = Company.find_by_slug(params[:id])
    end

    def company_params
      params.require(@company).permit(:name, :description, :home_site, :slug, :country_id, :city_id, :zip, :email, :phone, :address, :logo)
    end
end
