class ProvincesController < ApplicationController

  before_filter :find_province, :except => [:index, :new, :create]

  respond_to :html, :xml, :json

  # GET /provinces
  # GET /provinces.json
  # GET /provinces.xml
  def index
    @provinces = Province.all
    flash.now[:notice] = t('flash.actions.index.notice') if @provinces.empty?
    respond_with(@provinces)
  end

  # GET /provinces/1
  # GET /provinces/1.json
  # GET /provinces/1.xml
  def show
    respond_with(@province)
  end

  # GET /provinces/new
  # GET /provinces/new.json
  # GET /provinces/new.xml
  def new
    @province = Province.new
    respond_with(@province)
  end

  # GET /provinces/1/edit
  # GET /provinces/1/edit.json
  # GET /provinces/1/edit.xml
  def edit
    respond_with(@province)
  end

  # POST /provinces
  # POST /provinces.json
  # POST /provinces.xml
  def create
    @province = Province.new(params[:province])
    flash[:notice] = t('scaffold.notice.created', :item => Province.model_name.human) if @province.save
    respond_with(@province, :location => provinces_path)
  end

  # PUT /provinces/1
  # PUT /provinces/1.json
  # PUT /provinces/1.xml
  def update
    flash[:notice] = t('scaffold.notice.updated', :item => Province.model_name.human) if @province.update_attributes(params[:province])
    respond_with(@province, :location => provinces_path)
  end

  # DELETE /provinces/1
  # DELETE /provinces/1.json
  # DELETE /provinces/1.xml
  def destroy
    flash[:notice] = t('scaffold.notice.destroyed', :item => Province.model_name.human) if @province.destroy
    respond_with(@province)
  end

  protected

  def find_province
    @province = Province.find(params[:id])
  end
end

