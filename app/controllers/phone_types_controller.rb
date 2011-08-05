class PhoneTypesController < ApplicationController
	respond_to :html, :xml, :json

	def index
		@phone_types = PhoneType.all
		flash.now[:notice] = "No se encontraron registros" if @phone_types.empty?
		respond_with(@phone_types)
	end

	def show
		@phone_type = PhoneType.find(params[:id])
		respond_with(@phone_type)
	end

	def new
		@phone_type = PhoneType.new
		respond_with(@phone_type)
	end

	def create
		@phone_type = PhoneType.new(params[:phone_type])
		@phone_type.company_id = current_company.id
		flash[:notice] = "Tipo de Teléfono creado con exito." if @phone_type.save
		respond_with(@phone_type)
	end

	def edit
		@phone_type = PhoneType.find(params[:id])
		respond_with(@phone_type)
	end

	def update
		@phone_type = PhoneType.find(params[:id])
		flash[:notice] = "Tipo de Teléfono actualizado con exito." if @phone_type.update_attributes(params[:phone_type])
		respond_with(@phone_type)
	end

	def destroy
		@phone_type = PhoneType.find(params[:id])
		@phone_type.destroy
		flash[:notice] = "Tipo de Teléfono borrado con exito." if @phone_type.destroy
		respond_with(@phone_type)
	end
end
