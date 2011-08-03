class MaritalStatusesController < ApplicationController
	respond_to :html, :xml, :json

	def index
		@marital_statuses = MaritalStatus.all
		flash.now[:notice] = "No se encontraron registros" if @marital_statuses.empty?
		respond_with(@marital_statuses)
	end

	def show
		@marital_status = MaritalStatus.find(params[:id])
		respond_with(@marital_status)
	end

	def new
		@marital_status = MaritalStatus.new
		respond_with(@marital_status)
	end

	def create
		@marital_status = MaritalStatus.new(params[:marital_status])
		@marital_status.company = current_company
		flash[:notice] = "Estado Civil creado con exito." if @marital_status.save
		respond_with(@marital_status)
	end

	def edit
		@marital_status = MaritalStatus.find(params[:id])
		respond_with(@marital_status)
	end

	def update
		@marital_status = MaritalStatus.find(params[:id])
		flash[:notice] = "Estado Civil actualizado con exito." if @marital_status.update_attributes(params[:marital_status])
	end

	def destroy
		@marital_status = MaritalStatus.find(params[:id])
		@marital_status.destroy
		flash[:notice] = "Estado Civil borrado con exito." if @marital_status.destroy
		respond_with(@marital_status)
	end
end
