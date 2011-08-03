class CareTypesController < ApplicationController
	respond_to :html, :xml, :json

	def index
		@care_types = CareType.all
		flash.now[:notice] = "No se encontraron registros" if @care_types.empty?
		respond_with(@care_types)
	end

	def show
		@care_type = CareType.find(params[:id])
		respond_with(@care_type)
	end

	def new
		@care_type = CareType.new
		respond_with(@care_type)
	end

	def create
		@care_type = CareType.new(params[:care_type])
		@care_type.company = current_company
		flash[:notice] = "Care Type creada con exito." if @care_type.save
		respond_with(@care_type)
	end

	def edit
		@care_type = CareType.find(params[:id])
		respond_with(@care_type)
	end

	def update
		@care_type = CareType.find(params[:id])
		flash[:notice] = "Care Type actualizada con exito." if @care_type.update_attributes(params[:care_type])
	end

	def destroy
		@care_type = CareType.find(params[:id])
		@care_type.destroy
		flash[:notice] = "Care Type borrada con exito." if @care_type.destroy
		respond_with(@care_type)
	end
end
