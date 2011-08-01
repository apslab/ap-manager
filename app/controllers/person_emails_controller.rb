class PersonEmailsController < ApplicationController
  respond_to :html, :xml, :json

  def index
    @person_emails = PersonEmail.all
	flash.now[:notice] = "No se encontraron registros" if @person_emails.empty?
    respond_with(@person_emails)
  end

  def show
    @person_email = PersonEmail.find(params[:id])
    respond_with(@person_email)
  end

  def new
    @person_email = PersonEmail.new
    respond_with(@person_email)
  end

  def create
    @person_email = PersonEmail.new(params[:person_email])
	flash[:notice] = "Email de la Persona creado con exito." if @person_email.save
    respond_with(@person_email)
  end

  def edit
    @person_email = PersonEmail.find(params[:id])
    respond_with(@person_email)
  end

  def update
    @person_email = PersonEmail.find(params[:id])
	flash[:notice] = "Email de la Persona actualizado con exito." if @person_email.update_attributes(params[:person_email])
  end

  def destroy
    @person_email = PersonEmail.find(params[:id])
    @person_email.destroy
	flash[:notice] = "Email de la Persona borrado con exito." if @person_email.destroy
    respond_with(@person_email)
  end
end
