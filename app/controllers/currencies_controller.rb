class CurrenciesController < ApplicationController
  respond_to :html, :xml, :json

  def index
    @currencies = Currency.all
	flash.now[:notice] = "No se encontraron registros" if @currencies.empty?
    respond_with(@currencies)
  end

  def show
    @currency = Currency.find(params[:id])
    respond_with(@currency)
  end

  def new
    @currency = Currency.new
    respond_with(@currency)
  end

  def create
    @currency = Currency.new(params[:currency])
	@currency.company = current_company
	flash[:notice] = "Moneda creado con exito." if @currency.save
    respond_with(@currency)
  end

  def edit
    @currency = Currency.find(params[:id])
    respond_with(@currency)
  end

  def update
    @currency = Currency.find(params[:id])
	flash[:notice] = "Moneda actualizado con exito." if @currency.update_attributes(params[:currency])
  end

  def destroy
    @currency = Currency.find(params[:id])
    @currency.destroy
	flash[:notice] = "Moneda borrado con exito." if @currency.destroy
    respond_with(@currency)
  end
end
