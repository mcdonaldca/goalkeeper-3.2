Goalkeeper::Application.routes.draw do

  resources :users, :goals, :atoms

  root :to => 'gk#index', :as => :index
  get "feed" => "gk#feed", :as => :feed

  get "login" => "auth#login", :as => :login
  get "logout" => "auth#logout", :as => :logout
  post "do_login" => "auth#do_login", :as => :do_login

  get 'login/venmo' => "auth#venmo", :as => :venmo

  get  'authorization' => 'auth#authorization'
  post 'authorization' => 'auth#authorization'

  post 'goals/new/commitment' => 'goals#commitment', :as => :commitment
  post 'goals/new/action' => 'goals#action', :as => :action

  get 'goals/:id/atoms' => 'goals#atoms'

  get 'goals/:id/success/' => 'atoms#success', :as => :success
  get 'goals/:id/failure/' => 'atoms#failure', :as => :failure

  post 'proof' => 'atoms#proof'

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
