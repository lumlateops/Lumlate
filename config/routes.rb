Lumlate::Application.routes.draw do
  get "home/index"

  devise_for :users

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

  resources :deals do
    resources :votes, :only => :create
  end

  match 'deals_by_max_or_min_value' => 'deals#deal_emails_by_max_or_min_value'
  match 'deals_by_expiry_date' => 'deals#deal_emails_by_expiry_date'
  match 'deals_with_last_expiry_date' => 'deals#deal_emails_with_last_expiry_date'
  match 'deals_by_companies' => 'deals#deal_emails_by_companies'
  match 'deals_with_tags' => 'deals#deal_emails_with_tags'
  match 'deals_by_rating' => 'deals#deal_emails_by_rating'
  match 'deals_in_value_range' => 'deals#deal_emails_in_value_range'

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
  root :to => "home#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

