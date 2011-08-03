class ProfessionalSpecialitiesController < ApplicationController
	respond_to :html, :xml, :json

	def index
		@professional_specialities = ProfessionalSpeciality.all
		flash.now[:notice] = "No se encontraron registros" if @professional_specialities.empty?
		respond_with(@professional_specialities)
	end

	def show
		@professional_speciality = ProfessionalSpeciality.find(params[:id])
		respond_with(@professional_speciality)
	end

	def new
		@professional_speciality = ProfessionalSpeciality.new
		respond_with(@professional_speciality)
	end

	def create
		@professional_speciality = ProfessionalSpeciality.new(params[:professional_speciality])
		flash[:notice] = "Professional Speciality creada con exito." if @professional_speciality.save
		respond_with(@professional_speciality)
	end

	def edit
		@professional_speciality = ProfessionalSpeciality.find(params[:id])
		respond_with(@professional_speciality)
	end

	def update
		@professional_speciality = ProfessionalSpeciality.find(params[:id])
		flash[:notice] = "Professional Speciality actualizada con exito." if @professional_speciality.update_attributes(params[:professional_speciality])
	end

	def destroy
		@professional_speciality = ProfessionalSpeciality.find(params[:id])
		@professional_speciality.destroy
		flash[:notice] = "Professional Speciality borrada con exito." if @professional_speciality.destroy
		respond_with(@professional_speciality)
	end
end
