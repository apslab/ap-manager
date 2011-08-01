class ServicesController < ApplicationController
  respond_to :html, :xml, :json

  def index
    @services = Service.all
	flash.now[:notice] = "No se encontraron registros" if @services.empty?
    respond_with(@services)
  end

  def show
    @service = Service.find(params[:id])
    respond_with(@service)
  end

  def new
    @service = Service.new
    respond_with(@service)
  end

  def create
    @service = Service.new(params[:service])
	@service.company = current_company
	flash[:notice] = "Servicio creado con exito." if @service.save
    respond_with(@service)
  end

  def edit
    @service = Service.find(params[:id])
    respond_with(@service)
  end

  def update
    @service = Service.find(params[:id])
	flash[:notice] = "Servicio actualizado con exito." if @service.update_attributes(params[:service])
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy
	flash[:notice] = "Servicio borrado con exito." if @service.destroy
    respond_with(@service)
  end
end
