class SpecialtiesController < ApplicationController
	respond_to :html, :xml, :json

	def index
		@specialties = Specialty.all
		flash.now[:notice] = "No se encontraron registros" if @specialties.empty?
		respond_with(@specialties)
	end

	def show
		@specialty = Specialty.find(params[:id])
		respond_with(@specialty)
	end

	def new
		@specialty = Specialty.new
		respond_with(@specialty)
	end

	def create
		@specialty = Specialty.new(params[:specialty])
		@specialty.company_id = current_company.id
		flash[:notice] = "Especialidad creada con exito." if @specialty.save
		respond_with(@specialty)
	end

	def edit
		@specialty = Specialty.find(params[:id])
		respond_with(@specialty)
	end

	def update
		@specialty = Specialty.find(params[:id])
		flash[:notice] = "Especialidad actualizada con exito." if @specialty.update_attributes(params[:specialty])
		respond_with(@specialty)
	end

	def destroy
		@specialty = Specialty.find(params[:id])
		@specialty.destroy
		flash[:notice] = "Especialidad borrada con exito." if @specialty.destroy
		respond_with(@specialty)
	end
end
