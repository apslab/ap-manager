class ServiceSpecialtiesController < ApplicationController
	respond_to :html, :xml, :json

	def index
		@service_specialties = ServiceSpecialty.all
		flash.now[:notice] = "No se encontraron registros" if @service_specialties.empty?
		respond_with(@service_specialties)
	end

	def show
		@service_specialty = ServiceSpecialty.find(params[:id])
		respond_with(@service_specialty)
	end

	def new
		@service_specialty = ServiceSpecialty.new
		respond_with(@service_specialty)
	end

	def create
		@service_specialty = ServiceSpecialty.new(params[:service_specialty])
		flash[:notice] = "Especialidad por Servicio creado con exito." if @service_specialty.save
		respond_with(@service_specialty)
	end

	def edit
		@service_specialty = ServiceSpecialty.find(params[:id])
		respond_with(@service_specialty)
	end

	def update
		@service_specialty = ServiceSpecialty.find(params[:id])
		flash[:notice] = "Especialidad por Servicio actualizado con exito." if @service_specialty.update_attributes(params[:service_specialty])
	end

	def destroy
		@service_specialty = ServiceSpecialty.find(params[:id])
		@service_specialty.destroy
		flash[:notice] = "Especialidad por Servicio borrado con exito." if @service_specialty.destroy
		respond_with(@service_specialty)
	end
end
