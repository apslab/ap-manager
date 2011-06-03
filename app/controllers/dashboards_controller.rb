class DashboardsController < AuthorizedController
  skip_authorization_check :only => [:show]
  skip_load_and_authorize_resource :only => [:show]

  def show
  end
end
