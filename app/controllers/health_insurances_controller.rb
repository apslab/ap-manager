class HealthInsurancesController < ApplicationController
	respond_to :html, :xml, :json

	def index
		@health_insurances = HealthInsurance.all
		flash.now[:notice] = "No se encontraron registros" if @health_insurances.empty?
		respond_with(@health_insurances)
	end

	def show
		@health_insurance = HealthInsurance.find(params[:id])
		respond_with(@health_insurance)
	end

	def new
		@health_insurance = HealthInsurance.new
		respond_with(@health_insurance)
	end

	def create
		@health_insurance = HealthInsurance.new(params[:health_insurance])
		@health_insurance.company_id = current_company.id
		flash[:notice] = "Obra Social creada con exito." if @health_insurance.save
		respond_with(@health_insurance)
	end

	def edit
		@health_insurance = HealthInsurance.find(params[:id])
		respond_with(@health_insurance)
	end

	def update
		@health_insurance = HealthInsurance.find(params[:id])
		flash[:notice] = "Obra Social actualizada con exito." if @health_insurance.update_attributes(params[:health_insurance])
		respond_with(@health_insurance)
	end

	def destroy
		@health_insurance = HealthInsurance.find(params[:id])
		@health_insurance.destroy
		flash[:notice] = "Obra Social borrada con exito." if @health_insurance.destroy
		respond_with(@health_insurance)
	end
end
