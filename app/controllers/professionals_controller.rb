class ProfessionalsController < ApplicationController
	respond_to :html, :xml, :json

	def index
		@professionals = Professional.all
		flash.now[:notice] = "No se encontraron registros" if @professionals.empty?
		respond_with(@professionals)
	end

	def show
		@professional = Professional.find(params[:id])
		respond_with(@professional)
	end

	def new
		@professional = Professional.new
		respond_with(@professional)
	end

	def create
		@professional = Professional.new(params[:professional])
		flash[:notice] = "Profesional creado con exito." if @professional.save
		respond_with(@professional)
	end

	def edit
		@professional = Professional.find(params[:id])
		respond_with(@professional)
	end

	def update
		@professional = Professional.find(params[:id])
		flash[:notice] = "Profesional actualizado con exito." if @professional.update_attributes(params[:professional])
		respond_with(@professional)
	end

	def destroy
		@professional = Professional.find(params[:id])
		@professional.destroy
		flash[:notice] = "Profesional borrado con exito." if @professional.destroy
		respond_with(@professional)
	end
end
