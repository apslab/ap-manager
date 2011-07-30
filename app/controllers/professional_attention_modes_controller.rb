class ProfessionalAttentionModesController < ApplicationController
  respond_to :html, :xml, :json

  def index
    @professional_attention_modes = ProfessionalAttentionMode.all
	flash.now[:notice] = "No se encontraron registros" if @professional_attention_modes.empty?
    respond_with(@professional_attention_modes)
  end

  def show
    @professional_attention_mode = ProfessionalAttentionMode.find(params[:id])
    respond_with(@professional_attention_mode)
  end

  def new
    @professional_attention_mode = ProfessionalAttentionMode.new
    respond_with(@professional_attention_mode)
  end

  def create
    @professional_attention_mode = ProfessionalAttentionMode.new(params[:professional_attention_mode])
	flash[:notice] = "Professional Attention Mode creado con exito." if @professional_attention_mode.save
    respond_with(@professional_attention_mode)
  end

  def edit
    @professional_attention_mode = ProfessionalAttentionMode.find(params[:id])
    respond_with(@professional_attention_mode)
  end

  def update
    @professional_attention_mode = ProfessionalAttentionMode.find(params[:id])
	flash[:notice] = "Professional Attention Mode actualizado con exito." if @professional_attention_mode.update_attributes(params[:professional_attention_mode])
  end

  def destroy
    @professional_attention_mode = ProfessionalAttentionMode.find(params[:id])
    @professional_attention_mode.destroy
	flash[:notice] = "Professional Attention Mode borrado con exito." if @professional_attention_mode.destroy
    respond_with(@professional_attention_mode)
  end
end
