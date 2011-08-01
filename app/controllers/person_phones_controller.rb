class PersonPhonesController < ApplicationController
  respond_to :html, :xml, :json

  def index
    @person_phones = PersonPhone.all
	flash.now[:notice] = "No se encontraron registros" if @person_phones.empty?
    respond_with(@person_phones)
  end

  def show
    @person_phone = PersonPhone.find(params[:id])
    respond_with(@person_phone)
  end

  def new
    @person_phone = PersonPhone.new
    respond_with(@person_phone)
  end

  def create
    @person_phone = PersonPhone.new(params[:person_phone])
	flash[:notice] = "Teléfono de la Person creado con exito." if @person_phone.save
    respond_with(@person_phone)
  end

  def edit
    @person_phone = PersonPhone.find(params[:id])
    respond_with(@person_phone)
  end

  def update
    @person_phone = PersonPhone.find(params[:id])
	flash[:notice] = "Teléfono de la Person actualizado con exito." if @person_phone.update_attributes(params[:person_phone])
  end

  def destroy
    @person_phone = PersonPhone.find(params[:id])
    @person_phone.destroy
	flash[:notice] = "Teléfono de la Person borrado con exito." if @person_phone.destroy
    respond_with(@person_phone)
  end
end
