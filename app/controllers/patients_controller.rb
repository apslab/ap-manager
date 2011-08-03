class PatientsController < ApplicationController
	respond_to :html, :xml, :json

	def index
		@patients = Patient.all
		flash.now[:notice] = "No se encontraron registros" if @patients.empty?
		respond_with(@patients)
	end

	def show
		@patient = Patient.find(params[:id])
		respond_with(@patient)
	end

	def new
		@patient = Patient.new
		respond_with(@patient)
	end

	def create
		@patient = Patient.new(params[:patient])
		flash[:notice] = "Paciente creado con exito." if @patient.save
		respond_with(@patient)
	end

	def edit
		@patient = Patient.find(params[:id])
		respond_with(@patient)
	end

	def update
		@patient = Patient.find(params[:id])
		flash[:notice] = "Paciente actualizado con exito." if @patient.update_attributes(params[:patient])
	end

	def destroy
		@patient = Patient.find(params[:id])
		@patient.destroy
		flash[:notice] = "Paciente borrado con exito." if @patient.destroy
		respond_with(@patient)
	end
end
