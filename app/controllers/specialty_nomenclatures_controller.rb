class SpecialtyNomenclaturesController < ApplicationController
	respond_to :html, :xml, :json

	def index
		@specialty_nomenclatures = SpecialtyNomenclature.all
		flash.now[:notice] = "No se encontraron registros" if @specialty_nomenclatures.empty?
		respond_with(@specialty_nomenclatures)
	end

	def show
		@specialty_nomenclature = SpecialtyNomenclature.find(params[:id])
		respond_with(@specialty_nomenclature)
	end

	def new
		@specialty_nomenclature = SpecialtyNomenclature.new
		respond_with(@specialty_nomenclature)
	end

	def create
		@specialty_nomenclature = SpecialtyNomenclature.new(params[:specialty_nomenclature])
		flash[:notice] = "Especialidad por Nomenclador creada con exito." if @specialty_nomenclature.save
		respond_with(@specialty_nomenclature)
	end

	def edit
		@specialty_nomenclature = SpecialtyNomenclature.find(params[:id])
		respond_with(@specialty_nomenclature)
	end

	def update
		@specialty_nomenclature = SpecialtyNomenclature.find(params[:id])
		flash[:notice] = "Especialidad por Nomenclador actualizada con exito." if @specialty_nomenclature.update_attributes(params[:specialty_nomenclature])
		respond_with(@specialty_nomenclature)
	end

	def destroy
		@specialty_nomenclature = SpecialtyNomenclature.find(params[:id])
		@specialty_nomenclature.destroy
		flash[:notice] = "Especialidad por Nomenclador borrada con exito." if @specialty_nomenclature.destroy
		respond_with(@specialty_nomenclature)
	end
end
