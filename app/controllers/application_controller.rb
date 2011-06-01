class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_company

  # custom layout
  layout :layout_by_resource

  # devise close for all!
  before_filter :authenticate_user!

  protected

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
