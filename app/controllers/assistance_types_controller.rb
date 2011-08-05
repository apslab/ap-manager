class AssistanceTypesController < ApplicationController
	respond_to :html, :xml, :json

	def index
		@assistance_types = AssistanceType.all
		flash.now[:notice] = "No se encontraron registros" if @assistance_types.empty?
		respond_with(@assistance_types)
	end

	def show
		@assistance_type = AssistanceType.find(params[:id])
		respond_with(@assistance_type)
	end

	def new
		@assistance_type = AssistanceType.new
		respond_with(@assistance_type)
	end

	def create
		@assistance_type = AssistanceType.new(params[:assistance_type])
		@assistance_type.company_id = current_company.id
		flash[:notice] = "Tipo de Asistencia creado con exito." if @assistance_type.save
		respond_with(@assistance_type)
	end

	def edit
		@assistance_type = AssistanceType.find(params[:id])
		respond_with(@assistance_type)
	end

	def update
		@assistance_type = AssistanceType.find(params[:id])
		flash[:notice] = "Tipo de Asistencia actualizado con exito." if @assistance_type.update_attributes(params[:assistance_type])
		respond_with(@assistance_type)
	end

	def destroy
		@assistance_type = AssistanceType.find(params[:id])
		@assistance_type.destroy
		flash[:notice] = "Tipo de Asistencia borrado con exito." if @assistance_type.destroy
		respond_with(@assistance_type)
	end
end
