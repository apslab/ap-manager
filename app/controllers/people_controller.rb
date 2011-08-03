class PeopleController < ApplicationController
	respond_to :html, :xml, :json

	def index
		@people = Person.all
		flash.now[:notice] = "No se encontraron registros" if @people.empty?
		respond_with(@people)
	end

	def show
		@person = Person.find(params[:id])
		respond_with(@person)
	end

	def new
		@person = Person.new
		respond_with(@person)
	end

	def create
		@person = Person.new(params[:person])
		flash[:notice] = "Persona creada con exito." if @person.save
		respond_with(@person)
	end

	def edit
		@person = Person.find(params[:id])
		respond_with(@person)
	end

	def update
		@person = Person.find(params[:id])
		flash[:notice] = "Persona actualizada con exito." if @person.update_attributes(params[:person])
	end

	def destroy
		@person = Person.find(params[:id])
		@person.destroy
		flash[:notice] = "Persona borrada con exito." if @person.destroy
		respond_with(@person)
	end
end
