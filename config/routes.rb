Globalflush::Application.routes.draw do
  get "home/index"
  get "home/about"
  get "home/graffiti_test"
  get "user_sessions/new"

  match 'map' => 'map#index', :as => :map, :via => :get
#  get 'bathroom_photos/:bathroom_id'
#  get 'bathroom_photos/new/:bathroom_id'
#  post 'bathroom_photos/:bathroom_id'
#  destroy 'bathroom_photos/:id'
  

  match 'bathroom_photos/:bathroom_id' => 'bathroom_photos#show', :via => :get, :as => :bathroom_photo
  match 'bathroom_photos/new/:bathroom_id' => 'bathroom_photos#new', :via => :get, :as => :new_bathroom_photo
  match 'bathroom_photos/:bathroom_id' => 'bathroom_photos#create', :via => :post, :as => :bathroom_photos
  match 'bathroom_photos/:id' => 'bathroom_photos#destroy', :via => :delete, :as => :bathroom_photo

  match 'graffiti_photos/:graffiti_id' => 'graffiti_photos#show', :via => :get, :as => :graffiti_photo
  match 'graffiti_photos/new/:graffiti_id' => 'graffiti_photos#new', :via => :get, :as => :new_graffiti_photo
  match 'graffiti_photos/:graffiti_id' => 'graffiti_photos#create', :via => :post, :as => :graffiti_photos
  match 'graffiti_photos/:id' => 'graffiti_photos#destroy', :via => :delete, :as => :graffiti_photo

#  root :to => "welcome#index"

  resources :user_sessions
  resources :users
  resources :password_resets
  resources :bathrooms do
    resources :graffiti
  end
  resources :graffiti
  resources :comments
  resources :ratings
 # resources :map
 # resources :bathroom_photos

  get "users/show"
  match 'users/show' => 'users#show', :as => :user_show

  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout
  match 'register' => 'users#new', :as => :register

  match 'search' => 'home#search', :as => :search, :via => :get

  root :to => "home#index"




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
