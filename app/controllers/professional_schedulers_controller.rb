class ProfessionalSchedulersController < ApplicationController
	respond_to :html, :xml, :json

	def index
		@professional_schedulers = ProfessionalScheduler.all
		flash.now[:notice] = "No se encontraron registros" if @professional_schedulers.empty?
		respond_with(@professional_schedulers)
	end

	def show
		@professional_scheduler = ProfessionalScheduler.find(params[:id])
		respond_with(@professional_scheduler)
	end

	def new
		@professional_scheduler = ProfessionalScheduler.new
		respond_with(@professional_scheduler)
	end

	def create
		@professional_scheduler = ProfessionalScheduler.new(params[:professional_scheduler])
		flash[:notice] = "Agenda del Profesional creado con exito." if @professional_scheduler.save
		respond_with(@professional_scheduler)
	end

	def edit
		@professional_scheduler = ProfessionalScheduler.find(params[:id])
		respond_with(@professional_scheduler)
	end

	def update
		@professional_scheduler = ProfessionalScheduler.find(params[:id])
		flash[:notice] = "Agenda del Profesional actualizado con exito." if @professional_scheduler.update_attributes(params[:professional_scheduler])
	end

	def destroy
		@professional_scheduler = ProfessionalScheduler.find(params[:id])
		@professional_scheduler.destroy
		flash[:notice] = "Agenda del Profesional borrado con exito." if @professional_scheduler.destroy
		respond_with(@professional_scheduler)
	end
end
