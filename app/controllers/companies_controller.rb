class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  
  def index
    @companies = policy_scope(Company)
  end
  
  def show
    authorize @company
  end
  
  def new
    @company = Company.new
    authorize @company
  end
  
  def create
    @company = Company.new(company_params)
    @company.user = current_user
    authorize @company
    if @company.valid?
      @company.save
      redirect_to company_path(@company)
    else
      render :new
    end
  end
  
  def edit
    authorize @company
  end
  
  def update
    @company.update(company_params)
    authorize @company
    if @company.save
      redirect_to company_path(@company)
    else
      render :edit
    end
  end
  
  def destroy
    @company.destroy
    authorize @company
    redirect_to companies_path
  end
  
  private
  
  def set_company
    @company = Company.find(params[:id])
  end
  
  def company_params
    params.require(:company).permit(:name, :address, :postcode, :city, :phone, :email, :siret, :tva)
  end
end
