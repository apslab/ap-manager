class TuningsController < ApplicationController
  respond_to :html, :xml, :json

  def index
    @tunings = Tuning.all
	flash.now[:notice] = "No se encontraron registros" if @tunings.empty?
    respond_with(@tunings)
  end

  def show
    @tuning = Tuning.find(params[:id])
    respond_with(@tuning)
  end

  def new
    @tuning = Tuning.new
    respond_with(@tuning)
  end

  def create
    @tuning = Tuning.new(params[:tuning])
	flash[:notice] = "Tuning creado con exito." if @tuning.save
    respond_with(@tuning)
  end

  def edit
    @tuning = Tuning.find(params[:id])
    respond_with(@tuning)
  end

  def update
    @tuning = Tuning.find(params[:id])
	flash[:notice] = "Tuning actualizado con exito." if @tuning.update_attributes(params[:tuning])
  end

  def destroy
    @tuning = Tuning.find(params[:id])
    @tuning.destroy
	flash[:notice] = "Tuning borrado con exito." if @tuning.destroy
    respond_with(@tuning)
  end
end
