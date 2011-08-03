class CareTypeDetailsController < ApplicationController
	respond_to :html, :xml, :json

	def index
		@care_type_details = CareTypeDetail.all
		flash.now[:notice] = "No se encontraron registros" if @care_type_details.empty?
		respond_with(@care_type_details)
	end

	def show
		@care_type_detail = CareTypeDetail.find(params[:id])
		respond_with(@care_type_detail)
	end

	def new
		@care_type_detail = CareTypeDetail.new
		respond_with(@care_type_detail)
	end

	def create
		@care_type_detail = CareTypeDetail.new(params[:care_type_detail])
		flash[:notice] = "Care Type Detail creado con exito." if @care_type_detail.save
		respond_with(@care_type_detail)
	end

	def edit
		@care_type_detail = CareTypeDetail.find(params[:id])
		respond_with(@care_type_detail)
	end

	def update
		@care_type_detail = CareTypeDetail.find(params[:id])
		flash[:notice] = "Care Type Detail actualizado con exito." if @care_type_detail.update_attributes(params[:care_type_detail])
	end

	def destroy
		@care_type_detail = CareTypeDetail.find(params[:id])
		@care_type_detail.destroy
		flash[:notice] = "Care Type Detail borrado con exito." if @care_type_detail.destroy
		respond_with(@care_type_detail)
	end
end
