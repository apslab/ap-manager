class ProfessionalValidationsController < ApplicationController
	respond_to :html, :xml, :json

	def index
		@professional_validations = ProfessionalValidation.all
		flash.now[:notice] = "No se encontraron registros" if @professional_validations.empty?
		respond_with(@professional_validations)
	end

	def show
		@professional_validation = ProfessionalValidation.find(params[:id])
		respond_with(@professional_validation)
	end

	def new
		@professional_validation = ProfessionalValidation.new
		respond_with(@professional_validation)
	end

	def create
		@professional_validation = ProfessionalValidation.new(params[:professional_validation])
		flash[:notice] = "Professional Validation creado con exito." if @professional_validation.save
		respond_with(@professional_validation)
	end

	def edit
		@professional_validation = ProfessionalValidation.find(params[:id])
		respond_with(@professional_validation)
	end

	def update
		@professional_validation = ProfessionalValidation.find(params[:id])
		flash[:notice] = "Professional Validation actualizado con exito." if @professional_validation.update_attributes(params[:professional_validation])
		respond_with(@professional_validation)
	end

	def destroy
		@professional_validation = ProfessionalValidation.find(params[:id])
		@professional_validation.destroy
		flash[:notice] = "Professional Validation borrado con exito." if @professional_validation.destroy
		respond_with(@professional_validation)
	end
end
