# ESTA EN DESUSO!!!
class CompaniesController < AuthorizedController


  before_filter :find_company, :except => [:index, :new, :create]
  skip_before_filter :check_minimum_requirements, :only => [:new, :create]

  respond_to :html, :xml, :json

  # GET /companies
  # GET /companies.json
  # GET /companies.xml
  def index
    @companies = current_user.companies.all
    flash[:notice] = t('flash.actions.index.notice') if @companies.empty?
    respond_with(@companies)
  end

  # GET /companies/1
  # GET /companies/1.json
  # GET /companies/1.xml
  def show
    respond_with(@company)
  end

  # GET /companies/new
  # GET /companies/new.json
  # GET /companies/new.xml
  def new
    @company = Company.new
    respond_with(@company)
  end

  # GET /companies/1/edit
  # GET /companies/1/edit.json
  # GET /companies/1/edit.xml
  def edit
    respond_with(@company)
  end

  # POST /companies
  # POST /companies.json
  # POST /companies.xml
  def create
    @company = current_user.companies.build(params[:company])
    flash[:notice] = t('flash.actions.create.notice', :resource_name => Company.model_name.human) if @company.save
    respond_with(@company, :location => companies_path)
  end

  # PUT /companies/1
  # PUT /companies/1.json
  # PUT /companies/1.xml
  def update
    flash[:notice] = t('flash.actions.update.notice', :resource_name => Company.model_name.human) if @company.update_attributes(params[:company])
    respond_with(@company, :location => companies_path)
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  # DELETE /companies/1.xml
  def destroy
    flash[:notice] = t('flash.actions.destroy.notice', :resource_name => Company.model_name.human) if @company.destroy
    rescue Apslabs::Exceptions::IsOpen, Apslabs::Exceptions::HasEntries, Apslabs::Exceptions::HasExercises => e
      flash[:error] = e.message

    respond_with(@company)
  end

  protected

  def find_company
    @company = current_user.companies.find(params[:id])
  end

end

