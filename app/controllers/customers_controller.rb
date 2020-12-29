class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  before_action :set_company, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  
  def index
    @customers = policy_scope(Customer).where(company_id: @company).sort
  end
  
  def show
    @quotes = @customer.quotes
    @bills = @customer.bills
    authorize @customer
  end
  
  def new
    @customer = Customer.new
    authorize @customer
  end
  
  def create
    @customer = Customer.new(customer_params)
    @customer.company = @company
    authorize @customer
    if @customer.save
      redirect_to company_customers_path(@company)
    else
      render :new
    end
  end
  
  def edit
    authorize @customer
  end
  
  def update
    @customer.update(customer_params)
    authorize @customer
    if @customer.save
      redirect_to company_customer_path(@company, @customer)
    else
      render :edit
    end
  end
  
  def destroy
    @customer.destroy
    authorize @customer
    redirect_to company_customers_path(@company)
  end
  
  private
  
  def set_customer
    @customer = Customer.find(params[:id])
  end
  
  def set_company
    @company = Company.find(params[:company_id])
  end
  
  def customer_params
    params.require(:customer).permit(:ref_client, :name, :address, :postcode, :city, :phone_1, :email_1, :phone_2, :email_2, :siren, :siret)
  end
end
