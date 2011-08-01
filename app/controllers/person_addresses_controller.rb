class PersonAddressesController < ApplicationController
  respond_to :html, :xml, :json

  def index
    @person_addresses = PersonAddress.all
	flash.now[:notice] = "No se encontraron registros" if @person_addresses.empty?
    respond_with(@person_addresses)
  end

  def show
    @person_address = PersonAddress.find(params[:id])
    respond_with(@person_address)
  end

  def new
    @person_address = PersonAddress.new
    respond_with(@person_address)
  end

  def create
    @person_address = PersonAddress.new(params[:person_address])
	flash[:notice] = "Domicilio de la Persona creado con exito." if @person_address.save
    respond_with(@person_address)
  end

  def edit
    @person_address = PersonAddress.find(params[:id])
    respond_with(@person_address)
  end

  def update
    @person_address = PersonAddress.find(params[:id])
	flash[:notice] = "Domicilio de la Persona actualizado con exito." if @person_address.update_attributes(params[:person_address])
  end

  def destroy
    @person_address = PersonAddress.find(params[:id])
    @person_address.destroy
	flash[:notice] = "Domicilio de la Persona borrado con exito." if @person_address.destroy
    respond_with(@person_address)
  end
end
