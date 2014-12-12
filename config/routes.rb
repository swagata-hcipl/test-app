Rails.application.routes.draw do


  #mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :users
  resources :assests

  root "session#login"
  get "signup", :to => "user#new"
  get "login", :to => "session#login"
  get "logout", :to => "session#logout"
  get "home", :to => "session#home"
  get "active", :to => "session#active"
  get "inactive", :to => "session#inactive" 
  get "create_asset", :to => "asset#new"
  get "create_vendor", :to => "vendor#new"
  get "create_owner", :to => "owner#new"
  get "create_employee", :to => "employee#new"

  get 'session/home'

  get 'session/login'
  post 'session/login_attempt'

  get 'session/all'

  get 'session/active'

  get 'session/inactive'

  get 'asset/view'

  get 'asset/new'
  post 'asset/create'

  get 'asset/edit'
  post 'asset/update'

  get 'user/new'
  post 'user/create'


  get 'vendor/view'

  get 'owner/view'

  get 'owner/new'
  post 'owner/create'

  get 'owner/edit'
  post 'owner/update'

  get 'vendor/new'
  post 'vendor/create'

  get 'vendor/edit'
  post 'vendor/update'

  get 'employee/register'
  post 'employee/create'

  get 'employee/profile'

  get 'employee/edit'
  post 'employee/update'

  get 'employee/delete'

  


  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
