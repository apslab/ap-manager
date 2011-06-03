class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_company

  # custom layout
  layout :layout_by_resource

  # devise close for all!
  before_filter :authenticate_user!

  before_filter :check_change_company

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end

  protected

  def check_change_company
    return if params[:cc].blank?
    current_user.change_current_company_for(params[:cc])
    @current_user = @current_ability = nil
    redirect_to :back
  end

  def current_company
    current_user.current_company || current_user.companies.first
  end

  def layout_by_resource
    if devise_controller?
      'application'
    else
      'apslabs'
    end
  end

end
