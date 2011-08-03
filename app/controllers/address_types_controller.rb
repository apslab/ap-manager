class AddressTypesController < ApplicationController
	respond_to :html, :xml, :json

	def index
		@address_types = AddressType.all
		flash.now[:notice] = "No se encontraron registros" if @address_types.empty?
		respond_with(@address_types)
	end

	def show
		@address_type = AddressType.find(params[:id])
		respond_with(@address_type)
	end

	def new
		@address_type = AddressType.new
		respond_with(@address_type)
	end

	def create
		@address_type = AddressType.new(params[:address_type])
		@address_type.company = current_company
		flash[:notice] = "Tipo de Dirección creado con exito." if @address_type.save
		respond_with(@address_type)
	end

	def edit
		@address_type = AddressType.find(params[:id])
		respond_with(@address_type)
	end

	def update
		@address_type = AddressType.find(params[:id])
		flash[:notice] = "Tipo de Dirección actualizado con exito." if @address_type.update_attributes(params[:address_type])
	end

	def destroy
		@address_type = AddressType.find(params[:id])
		@address_type.destroy
		flash[:notice] = "Tipo de Dirección borrado con exito." if @address_type.destroy
		respond_with(@address_type)
	end
end
