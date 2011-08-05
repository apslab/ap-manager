class EmailTypesController < ApplicationController
	respond_to :html, :xml, :json

	def index
		@email_types = EmailType.all
		flash.now[:notice] = "No se encontraron registros" if @email_types.empty?
		respond_with(@email_types)
	end

	def show
		@email_type = EmailType.find(params[:id])
		respond_with(@email_type)
	end

	def new
		@email_type = EmailType.new
		respond_with(@email_type)
	end

	def create
		@email_type = EmailType.new(params[:email_type])
		@email_type.company_id = current_company.id
		flash[:notice] = "Tipo de Email creado con exito." if @email_type.save
		respond_with(@email_type)
	end

	def edit
		@email_type = EmailType.find(params[:id])
		respond_with(@email_type)
	end

	def update
		@email_type = EmailType.find(params[:id])
		flash[:notice] = "Tipo de Email actualizado con exito." if @email_type.update_attributes(params[:email_type])
		respond_with(@email_type)
	end

	def destroy
		@email_type = EmailType.find(params[:id])
		@email_type.destroy
		flash[:notice] = "Tipo de Email borrado con exito." if @email_type.destroy
		respond_with(@email_type)
	end
end
