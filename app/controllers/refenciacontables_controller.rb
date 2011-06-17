class RefenciacontablesController < ApplicationController

  before_filter :find_refenciacontable, :except => [:index, :new, :create]

  respond_to :html, :xml, :json

  # GET /refenciacontables
  # GET /refenciacontables.json
  # GET /refenciacontables.xml
  def index
    #@refenciacontables = Refenciacontable.all
    
    @search = Refenciacontable.by_company(current_company).search(params[:search])
    @refenciacontables = @search.page(params[ :page ]).per(10)
  
    flash[:notice] = t('flash.actions.index.notice') if @refenciacontables.empty?
    respond_with(@refenciacontables)
  end

  # GET /refenciacontables/1
  # GET /refenciacontables/1.json
  # GET /refenciacontables/1.xml
  def show
    respond_with(@refenciacontable)
  end

  # GET /refenciacontables/new
  # GET /refenciacontables/new.json
  # GET /refenciacontables/new.xml
  def new
    @refenciacontable = current_company.refenciacontables.build
    
    #@refenciacontable = Refenciacontable.new
    respond_with(@refenciacontable)
  end

  # GET /refenciacontables/1/edit
  # GET /refenciacontables/1/edit.json
  # GET /refenciacontables/1/edit.xml
  def edit
    respond_with(@refenciacontable)
  end

  # POST /refenciacontables
  # POST /refenciacontables.json
  # POST /refenciacontables.xml
  def create
    @refenciacontable = Refenciacontable.new(params[:refenciacontable].update(:company_id => current_company.id))
    flash[:notice] = t('scaffold.notice.created', :item => Refenciacontable.model_name.human) if @refenciacontable.save
    respond_with(@refenciacontable, :location => refenciacontables_path)
  end

  # PUT /refenciacontables/1
  # PUT /refenciacontables/1.json
  # PUT /refenciacontables/1.xml
  def update
    flash[:notice] = t('scaffold.notice.updated', :item => Refenciacontable.model_name.human) if @refenciacontable.update_attributes(params[:refenciacontable])
    respond_with(@refenciacontable, :location => refenciacontables_path)
  end

  # DELETE /refenciacontables/1
  # DELETE /refenciacontables/1.json
  # DELETE /refenciacontables/1.xml
  def destroy
    flash[:notice] = t('scaffold.notice.destroyed', :item => Refenciacontable.model_name.human) if @refenciacontable.destroy
    respond_with(@refenciacontable)
  end

protected

  def find_refenciacontable
    @refenciacontable = current_company.refenciacontables.find(params[:id])
  end
end

