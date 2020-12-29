class BillServicesController < ApplicationController
  before_action :set_company, only: [:create, :destroy]
  before_action :set_customer, only: [:create, :destroy]
  before_action :set_bill, only: [:create, :destroy]

  def new
    @bill_service = BillService.new
  end
  
  def create
    service = Service.find(params[:service][:service_id])
    @bill_service = BillService.new(bill_services_params)
    @bill_service.service = service
    @bill_service.bill = @bill
    @bill_service.total_price_service = (service.unit_price * @bill_service.quantity).round(2)
    authorize @bill_service
    if @bill_service.save!
      new_price_duty_free = (@bill.price_duty_free + @bill_service.total_price_service).round(2)
      @bill.update(
        price_duty_free: new_price_duty_free,
        price_all_taxes: (new_price_duty_free + (new_price_duty_free * (@company.tva / 100))).round(2)
        )
      redirect_to company_customer_bill_path(@company, @customer, @bill)
    else
      render :new
    end
  end
  
  def destroy
    bill_service = BillService.find(params[:id])
    new_price_duty_free = (@bill.price_duty_free - bill_service.total_price_service).round(2)
    @bill.update(
      price_duty_free: new_price_duty_free,
      price_all_taxes: (new_price_duty_free + (new_price_duty_free * (@company.tva / 100))).round(2)
      )
    bill_service.destroy
    authorize bill_service
    redirect_to company_customer_bill_path(@company, @customer, @bill)
  end
  
  private
  
  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end
  
  def set_bill
    @bill = Bill.find(params[:bill_id])
  end

  def bill_services_params
    params.require(:bill_service).permit(:quantity)
  end
  
end