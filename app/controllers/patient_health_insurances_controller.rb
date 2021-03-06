class PatientHealthInsurancesController < ApplicationController
	respond_to :html, :xml, :json

	def index
		@patient_health_insurances = PatientHealthInsurance.all
		flash.now[:notice] = "No se encontraron registros" if @patient_health_insurances.empty?
		respond_with(@patient_health_insurances)
	end

	def show
		@patient_health_insurance = PatientHealthInsurance.find(params[:id])
		respond_with(@patient_health_insurance)
	end

	def new
		@patient_health_insurance = PatientHealthInsurance.new
		respond_with(@patient_health_insurance)
	end

	def create
		@patient_health_insurance = PatientHealthInsurance.new(params[:patient_health_insurance])
		flash[:notice] = "Paciente Obra Social creada con exito." if @patient_health_insurance.save
		respond_with(@patient_health_insurance)
	end

	def edit
		@patient_health_insurance = PatientHealthInsurance.find(params[:id])
		respond_with(@patient_health_insurance)
	end

	def update
		@patient_health_insurance = PatientHealthInsurance.find(params[:id])
		flash[:notice] = "Paciente Obra Social actualizada con exito." if @patient_health_insurance.update_attributes(params[:patient_health_insurance])
		respond_with(@patient_health_insurance)
	end

	def destroy
		@patient_health_insurance = PatientHealthInsurance.find(params[:id])
		@patient_health_insurance.destroy
		flash[:notice] = "Paciente Obra Social borrada con exito." if @patient_health_insurance.destroy
		respond_with(@patient_health_insurance)
	end
end
