class HealthInsurancePlansController < ApplicationController
  respond_to :html, :xml, :json

  def index
    @health_insurance_plans = HealthInsurancePlan.all
	flash.now[:notice] = "No se encontraron registros" if @health_insurance_plans.empty?
    respond_with(@health_insurance_plans)
  end

  def show
    @health_insurance_plan = HealthInsurancePlan.find(params[:id])
    respond_with(@health_insurance_plan)
  end

  def new
    @health_insurance_plan = HealthInsurancePlan.new
    respond_with(@health_insurance_plan)
  end

  def create
    @health_insurance_plan = HealthInsurancePlan.new(params[:health_insurance_plan])
	flash[:notice] = "Plan de la Obra Social creado con exito." if @health_insurance_plan.save
    respond_with(@health_insurance_plan)
  end

  def edit
    @health_insurance_plan = HealthInsurancePlan.find(params[:id])
    respond_with(@health_insurance_plan)
  end

  def update
    @health_insurance_plan = HealthInsurancePlan.find(params[:id])
	flash[:notice] = "Plan de la Obra Social actualizado con exito." if @health_insurance_plan.update_attributes(params[:health_insurance_plan])
  end

  def destroy
    @health_insurance_plan = HealthInsurancePlan.find(params[:id])
    @health_insurance_plan.destroy
	flash[:notice] = "Plan de la Obra Social borrado con exito." if @health_insurance_plan.destroy
    respond_with(@health_insurance_plan)
  end
end
