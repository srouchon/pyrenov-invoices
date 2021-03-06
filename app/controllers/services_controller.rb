class ServicesController < ApplicationController
  before_action :set_company, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :set_customer, only: [:new, :create]
  before_action :set_quote, only: [:new, :create]
  before_action :set_bill, only: [:new, :create]
  before_action :set_service, only: [:edit, :update, :destroy]

  def index
    @services = policy_scope(Service).where(company_id: @company)
  end

  def show
  end

  def new
    @service = Service.new
    authorize @service
  end

  def create
    quote = params[:quote_id] rescue nil
    bill = params[:bill_id] rescue nil
    customer = params[:customer_id] rescue nil
    service = Service.new(
      ref_service: service_params[:ref_service],
      description_service: service_params[:description_service],
      unit_price: service_params[:unit_price],
      quantity: service_params[:quantity],
      total_price_service: (service_params[:unit_price].to_i * service_params[:quantity].to_i).round(2)
    )
    service.company = @company
    authorize service
    if service.save!
      if customer.nil?
        redirect_to company_services_path(@company)
      elsif bill.nil?
        quote_service = QuoteService.create(service: service, quote: @quote)
        new_price_duty_free = (@quote.price_duty_free + quote_service.service.total_price_service).round(2)
        @quote.update(
          price_duty_free: new_price_duty_free,
          price_all_taxes: (new_price_duty_free + (new_price_duty_free * (@company.tva / 100))).round(2)
          )
        redirect_to company_customer_quote_path(@company, customer, quote)
      elsif quote.nil?
        bill_service = BillService.create(service: service, bill: @bill)
        new_price_duty_free = (@bill.price_duty_free + bill_service.service.total_price_service).round(2)
        @bill.update(
          price_duty_free: new_price_duty_free,
          price_all_taxes: (new_price_duty_free + (new_price_duty_free * (@company.tva / 100))).round(2)
          )
        redirect_to company_customer_bill_path(@company, customer, bill)
      end
    else
      render :new
    end
  end

  # def edit
  #   authorize @service
  # end

  # def update
  #   @service.update(service_params)
  #   authorize @service
  #   if @service.save
  #     redirect_to company_services_path(@company)
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   @service.destroy
  #   authorize @service
  #   redirect_to company_services_path(@company)
  # end

  private

  def set_company
    @company = Company.find(params[:company_id])
  end
  
  def set_customer
    @customer = Customer.find(params[:customer_id]) rescue nil
  end
  
  def set_quote
    @quote = Quote.find(params[:quote_id]) rescue nil
  end
  
  def set_bill
    @bill = Bill.find(params[:bill_id]) rescue nil
  end

  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:ref_service, :description_service, :unit_price, :quantity, :total_price_services)
  end

end
