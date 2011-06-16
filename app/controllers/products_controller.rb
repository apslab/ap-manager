class ProductsController < ApplicationController

  before_filter :find_product, :except => [:index, :new, :create]

  respond_to :html, :xml, :json

  # GET /products
  # GET /products.json
  # GET /products.xml
  def index
    @search = Product.by_company(current_company).search(params[:search])
    @products = @search.order("name").page(params[ :page ]).per(20)
    flash[:notice] = t('scaffold.notice.empty') if @products.empty?
    respond_with(@products)
  end

  # GET /products/1
  # GET /products/1.json
  # GET /products/1.xml
  def show
    respond_with(@product) do |format|
      format.json {render :json => {:porcentaje => @product.try(:tasaiva).try(:porcentaje).to_f,
        :price => @product.try(:price).to_f,
        :description => @product.observation.presence || @product.name }}
    end
  end

  # GET /products/new
  # GET /products/new.json
  # GET /products/new.xml
  def new
    @product = current_company.products.build
    respond_with(@product)
  end

  # GET /products/1/edit
  # GET /products/1/edit.json
  # GET /products/1/edit.xml
  def edit
    respond_with(@product)
  end

  # POST /products
  # POST /products.json
  # POST /products.xml
  def create    
    @product = Product.new(params[:product].update(:company_id => current_company.id))
    flash[:notice] = t('scaffold.notice.created', :item => Product.model_name.human) if @product.save
    respond_with(@product, :location => products_path)
  end

  # PUT /products/1
  # PUT /products/1.json
  # PUT /products/1.xml
  def update
    flash[:notice] = t('scaffold.notice.updated', :item => Product.model_name.human) if @product.update_attributes(params[:product])
    respond_with(@product, :location => products_path)
  end

  # DELETE /products/1
  # DELETE /products/1.json
  # DELETE /products/1.xml
  def destroy
    flash[:notice] = t('scaffold.notice.destroyed', :item => Product.model_name.human) if @product.destroy
    respond_with(@product)
  end

  protected

  def find_product
    @product = Product.find(params[:id])
  end
end

