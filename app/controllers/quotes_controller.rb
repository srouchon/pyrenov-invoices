class QuotesController < ApplicationController
  before_action :set_company, only: [:pdf, :index, :show, :new, :create, :edit, :update, :destroy]
  before_action :set_customer, only: [:pdf, :show, :new, :create, :edit, :update, :destroy]
  before_action :set_quote, only: [:pdf, :show, :edit, :update, :destroy]

  def pdf
    respond_to do |format|
      format.pdf do
        render pdf: "Devis",
          page_size: 'A4',
          template: "quotes/pdf",
          layout: "pdf",
          formats: [:html],
          orientation: "Portrait",
          lowquality: true,
          dpi: 75
      end
    end
    authorize @quote
  end

  def index
    @quotes = policy_scope(Quote)
  end

  def show
    @quote_service = QuoteService.new
    authorize @quote
  end

  def new
    @quote = Quote.new
    authorize @quote
  end

  def create
    quote = Quote.new(quote_params)
    quote.customer = @customer
    authorize quote
    if quote.save!
      redirect_to company_customer_quote_path(@company, @customer, quote)
    else
      render :new
    end
  end

  def edit
    @quote.services.where(company_id: @company)
    @quote.quote_services.where(quote: @quote)
    authorize @quote
  end

  def update
    date = "#{quote_params["date(1i)"]}-#{quote_params["date(2i)"]}-#{quote_params["date(3i)"]}"
    @quote.update(
      description: (@quote.description != quote_params[:description] ? quote_params[:description] : @quote.description),
      ref_quote: (@quote.ref_quote != quote_params[:ref_quote] ? quote_params[:ref_quote] : @quote.ref_quote),
      other: (@quote.other != quote_params[:other] ? quote_params[:other] : @quote.other),
      date: (@quote.date != quote_params[:date] ? quote_params[:date] : @quote.date),
      date_asked_payment: (@quote.date_asked_payment != quote_params[:date_asked_payment] ? quote_params[:date_asked_payment] : @quote.date_asked_payment),
      date_start_service: (@quote.date_start_service != quote_params[:date_start_service] ? quote_params[:date_start_service] : @quote.date_start_service),
      date_end_service: (@quote.date_end_service != quote_params[:date_end_service] ? quote_params[:date_end_service] : @quote.date_end_service),
      quote_status: (@quote.quote_status != params[:quote][:quote_status].downcase ? Quote.quote_statuses[params[:quote][:quote_status].downcase] : @quote.quote_status),
      deposit: (quote_params[:deposit] != 0 ? quote_params[:deposit] : 0)
    )
    authorize @quote
    if @quote.save!
      redirect_to company_customer_quote_path(@company, @customer, @quote)
    else
      render :edit
    end
  end

  def destroy
    @quote.destroy
    authorize @quote
    redirect_to company_customer_path(@company, @customer)
  end

  private

  def set_quote
    @quote = Quote.find(params[:id])
  end

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end

  def set_company
    @company = Company.find(params[:company_id])
  end

  def quote_params
    params.require(:quote).permit(:quote_status, :description, :ref_quote, :date,
                                  :date_asked_payment, :date_start_service, :date_end_service,
                                  :quote_status, :other, :deposit,
                                  :price_duty_free, :price_all_taxes)
  end
end
