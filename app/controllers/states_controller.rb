class StatesController < ApplicationController
  respond_to :html, :xml, :json

  def index
    @states = State.all
	flash.now[:notice] = "No se encontraron registros" if @states.empty?
    respond_with(@states)
  end

  def show
    @state = State.find(params[:id])
    respond_with(@state)
  end

  def new
    @state = State.new
    respond_with(@state)
  end

  def create
    @state = State.new(params[:state])
	flash[:notice] = "Estado creado con exito." if @state.save
    respond_with(@state)
  end

  def edit
    @state = State.find(params[:id])
    respond_with(@state)
  end

  def update
    @state = State.find(params[:id])
	flash[:notice] = "Estado actualizado con exito." if @state.update_attributes(params[:state])
  end

  def destroy
    @state = State.find(params[:id])
    @state.destroy
	flash[:notice] = "Estado borrado con exito." if @state.destroy
    respond_with(@state)
  end
end
