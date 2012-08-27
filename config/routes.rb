Jsovet::Application.routes.draw do

  devise_for :users
  resources :authors, :only => [:index]

  resources :contacts, :only => %w{new create}

  namespace :admin do
    resources :categories, :only => %w{index create edit update}
    resource :dashboard, :only => %w{show}, :controller => "dashboard"
    resources :articles, :only => "index"
  end

  resources :categories, :only => %w{index} do
    resources :articles
  end

  resources :articles, :only => %w{new create edit update} do

    collection do
      get 'my'
      post 'preview'
    end

    member do
      get 'publish', 'delete'
    end

    resources :comments, :only => %w{create update}
  end

  resources :images do
    collection do
      put "update_images"
    end
  end

  resources :avatars, :only => [:edit, :update]

  match 'search/index' => 'search#index', :as => :search


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
  #
  root :to => "home#index"
end
