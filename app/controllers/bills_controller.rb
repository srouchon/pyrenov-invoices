class BillsController < ApplicationController
  before_action :set_company, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :set_customer, only: [:show, :new, :create, :edit, :update, :destroy]
  before_action :set_bill, only: [:show, :edit, :update, :destroy]

  def index
    @bills = policy_scope(Bill)
  end
  
  def show
    @bill_service = BillService.new
    authorize @bill
  end
  
  def new
    @quotes = @customer.quotes
    @bill = Bill.new
    authorize @bill
  end
  
  def create
    @bill = Bill.new(bill_params)
    @bill.customer = @customer
    authorize @bill
    if @bill.save
      redirect_to company_customer_bill_path(@company, @customer, @bill)
    else
      render :new
    end
  end
  
  def edit
    @bill.services.where(company_id: @company)
    @bill.bill_services.where(bill: @bill)
    authorize @bill
  end
  
  def update
    date = "#{bill_params["date(1i)"]}-#{bill_params["date(2i)"]}-#{bill_params["date(3i)"]}"
    @bill.update(
      description: (@bill.description != bill_params[:description] ? bill_params[:description] : @bill.description), 
      ref_bill: (@bill.ref_bill != bill_params[:ref_bill] ? bill_params[:ref_bill] : @bill.ref_bill),
      date: (@bill.date != bill_params[:date] || date ? bill_params[:date] || date : @bill.date),
      bill_status: (@bill.bill_status != params[:bill][:bill_status].downcase ? Bill.bill_statuses[params[:bill][:bill_status].downcase] : @bill.bill_status),
      deposit: (bill_params[:deposit] != 0 ? bill_params[:deposit] : 0)
    )
    authorize @bill
    if @bill.save!
      redirect_to company_customer_bill_path(@company, @customer, @bill)
    else
      render :edit
    end
  end
  
  def destroy
    @bill.destroy
    authorize @bill
    redirect_to company_customer_path(@company, @customer)
  end
  
  private
  
  def set_bill
    @bill = Bill.find(params[:id])
  end
  
  def set_customer
    @customer = Customer.find(params[:customer_id])
  end
  
  def set_company
    @company = Company.find(params[:company_id])
  end
  
  def bill_params
    params.require(:bill).permit(:description, :ref_bill, :date, :bill_status, :deposit, :price_duty_free, :price_all_taxes)
  end
end
