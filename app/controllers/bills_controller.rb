class BillsController < ApplicationController
  before_action :set_company, only: [:pdf, :index, :show, :new, :create, :edit, :update, :destroy]
  before_action :set_customer, only: [:pdf, :show, :new, :create, :edit, :update, :destroy]
  before_action :set_bill, only: [:pdf, :show, :edit, :update, :destroy]

  def pdf
    @bill_amount_paid = (@bill.price_all_taxes - @bill.deposit).round(2)
    respond_to do |format|
      format.pdf do
          render pdf: "Facture",
          page_size: 'A4',
          template: "bills/pdf",
          layout: "pdf",
          formats: [:html],
          orientation: "Portrait",
          lowquality: true,
          dpi: 75
      end
    end
    authorize @bill
  end

  def index
    @bills = policy_scope(Bill)
  end

  def show
    @bill_service = BillService.new
    @bill_amount_paid = (@bill.price_all_taxes - @bill.deposit).round(2)
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
      other: (@bill.other != bill_params[:other] ? bill_params[:other] : @bill.other),
      date: (@bill.date != bill_params[:date] ? bill_params[:date] : @bill.date),
      date_asked_payment: (@bill.date_asked_payment != bill_params[:date_asked_payment] ? bill_params[:date_asked_payment] : @bill.date_asked_payment),
      date_start_service: (@bill.date_start_service != bill_params[:date_start_service] ? bill_params[:date_start_service] : @bill.date_start_service),
      date_end_service: (@bill.date_end_service != bill_params[:date_end_service] ? bill_params[:date_end_service] : @bill.date_end_service),
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
    params.require(:bill).permit(:description, :ref_bill, :date,
                                 :date_asked_payment, :date_start_service, :date_end_service,
                                 :bill_status, :other, :deposit,
                                 :price_duty_free, :price_all_taxes)
  end
end
