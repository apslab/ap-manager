ApSys::Application.routes.draw do
  resources :countries
  resources :provinces
  resources :products
  resources :refenciacontables
  resource :dashboard, :only => :show

  devise_for :users do
    get '/login' => 'devise/sessions#new', :as => :login
    get '/logout' => 'devise/sessions#destroy', :as => :logout
  end

  root :to => 'dashboards#show'

  resources :address_types
  resources :assistance_types
  resources :attention_modes
  resources :care_types
  resources :care_type_details
  resources :currencies
  resources :document_types
  resources :email_types
  resources :health_insurances do
    resources :health_insurance_plans
  end
  resources :marital_statuses
  resources :patients do
    resources :patient_health_insurances
  end
  resources :people do
    resources :person_addresses
    resources :person_emails
    resources :person_phones
  end
  resources :professionals do
    resources :professional_schedulers
    resources :professional_specialities
    resources :professional_attention_modes
    resources :professional_validations
  end
  resources :phone_types
  resources :services do
    resources :service_specialties
  end
  resources :specialties
  resources :specialty_nomenclatures
  resources :states

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
