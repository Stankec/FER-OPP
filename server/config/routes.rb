Sonja::Application.routes.draw do
  get "working_hours/index"
  get "working_hours/show"
  get "working_hours/edit"
  get "working_hours/new"
  get "statements/index"
  get "statements/show"
  get "statements/edit"
  get "statements/new"
  get "parts/index"
  get "parts/show"
  get "parts/edit"
  get "parts/new"
  get "orders/index"
  get "orders/show"
  get "orders/edit"
  get "orders/new"
  get "procedures/index"
  get "procedures/show"
  get "procedures/edit"
  get "procedures/new"
  get "vehicles/index"
  get "vehicles/show"
  get "vehicles/edit"
  get "vehicles/new"
  get "clients/index"
  get "clients/new"
  get "clients/edit"
  get "clients/show"
  get "roles/index"
  get "roles/new"
  get "roles/edit"
  # Networks
  get "networks/index"
  get "networks/new"
  get "networks/edit"
  # Settings
  get "settings/edit"
  # Categories
  get "categories/index"
  get "categories/show"
  get "categories/new"
  get "categories/edit"
  # HTML editor
  mount Ckeditor::Engine => '/ckeditor'
  # Sessions
  get "sessions/new"
  # Pages
  get "pages/index"
  get "pages/unpublished"
  get "pages/show"
  get "pages/edit"
  get "pages/new"
  get 'tags/:tag', to: 'pages#index', as: :tag
  # Users
  get "users/index"
  get "users/show"
  get "users/new"
  get "users/edit"
  # Login
  get "login" => "sessions#new", :as => "login"
  get "logout" => "sessions#destroy", :as => "logout"
  # Root
  root :to => "pages#index"

  resources :networks
  resources :images
  resources :settings
  resources :categories
  resources :sessions
  resources :pages
  resources :users


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

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
