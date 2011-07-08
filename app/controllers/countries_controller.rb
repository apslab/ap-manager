class CountriesController < ApplicationController

  before_filter :find_country, :except => [:index, :new, :create]

  respond_to :html, :xml, :json

  # GET /countries
  # GET /countries.json
  # GET /countries.xml
  def index
    @countries = Country.all
    flash.now[:notice] = t('flash.actions.index.notice') if @countries.empty?
    respond_with(@countries)
  end

  # GET /countries/1
  # GET /countries/1.json
  # GET /countries/1.xml
  def show
    respond_with(@country)
  end

  # GET /countries/new
  # GET /countries/new.json
  # GET /countries/new.xml
  def new
    @country = Country.new
    respond_with(@country)
  end

  # GET /countries/1/edit
  # GET /countries/1/edit.json
  # GET /countries/1/edit.xml
  def edit
    respond_with(@country)
  end

  # POST /countries
  # POST /countries.json
  # POST /countries.xml
  def create
    @country = Country.new(params[:country])
    flash[:notice] = t('scaffold.notice.created', :item => Country.model_name.human) if @country.save
    respond_with(@country, :location => countries_path)
  end

  # PUT /countries/1
  # PUT /countries/1.json
  # PUT /countries/1.xml
  def update
    flash[:notice] = t('scaffold.notice.updated', :item => Country.model_name.human) if @country.update_attributes(params[:country])
    respond_with(@country, :location => countries_path)
  end

  # DELETE /countries/1
  # DELETE /countries/1.json
  # DELETE /countries/1.xml
  def destroy
    flash[:notice] = t('scaffold.notice.destroyed', :item => Country.model_name.human) if @country.destroy
    respond_with(@country)
  end

  protected

  def find_country
    @country = Country.find(params[:id])
  end
end

