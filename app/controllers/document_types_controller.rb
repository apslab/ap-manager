class DocumentTypesController < ApplicationController
  respond_to :html, :xml, :json

  def index
    @document_types = DocumentType.all
	flash.now[:notice] = "No se encontraron registros" if @document_types.empty?
    respond_with(@document_types)
  end

  def show
    @document_type = DocumentType.find(params[:id])
    respond_with(@document_type)
  end

  def new
    @document_type = DocumentType.new
    respond_with(@document_type)
  end

  def create
    @document_type = DocumentType.new(params[:document_type])
	@document_type.company = current_company
	flash[:notice] = "Tipo de Documento creado con exito." if @document_type.save
    respond_with(@document_type)
  end

  def edit
    @document_type = DocumentType.find(params[:id])
    respond_with(@document_type)
  end

  def update
    @document_type = DocumentType.find(params[:id])
	flash[:notice] = "Tipo de Documento actualizado con exito." if @document_type.update_attributes(params[:document_type])
  end

  def destroy
    @document_type = DocumentType.find(params[:id])
    @document_type.destroy
	flash[:notice] = "Tipo de Documento borrado con exito." if @document_type.destroy
    respond_with(@document_type)
  end
end
