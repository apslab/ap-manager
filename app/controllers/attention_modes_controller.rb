class AttentionModesController < ApplicationController
	respond_to :html, :xml, :json

	def index
		@attention_modes = AttentionMode.all
		flash.now[:notice] = "No se encontraron registros" if @attention_modes.empty?
		respond_with(@attention_modes)
	end

	def show
		@attention_mode = AttentionMode.find(params[:id])
		respond_with(@attention_mode)
	end

	def new
		@attention_mode = AttentionMode.new
		respond_with(@attention_mode)
	end

	def create
		@attention_mode = AttentionMode.new(params[:attention_mode])
		@attention_mode.company = current_company
		flash[:notice] = "Modo de Atención creado con exito." if @attention_mode.save
		respond_with(@attention_mode)
	end

	def edit
		@attention_mode = AttentionMode.find(params[:id])
		respond_with(@attention_mode)
	end

	def update
		@attention_mode = AttentionMode.find(params[:id])
		flash[:notice] = "Modo de Atención actualizado con exito." if @attention_mode.update_attributes(params[:attention_mode])
	end

	def destroy
		@attention_mode = AttentionMode.find(params[:id])
		@attention_mode.destroy
		flash[:notice] = "Modo de Atención borrado con exito." if @attention_mode.destroy
		respond_with(@attention_mode)
	end
end
