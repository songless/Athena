ActionController::Routing::Routes.draw do |map|
  map.resources :posts
  map.resources :topics
  map.resources :forums

  map.resources :user_sessions
  map.resources :users
  map.resources :writes

  map.resource :info

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "hello"
  map.login "login", :controller => "user_sessions", :action => "new"
  map.logout "logout", :controller => "user_sessions", :action => "destroy"

  map.privacy "privacy", :controller => "info", :action => "privacy"
  map.terms "terms", :controller => "info", :action => "terms"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  map.books '/books/:bookNames/:chapter', :controller => 'read', :action => 'readChapter'      
  map.books '/books/:bookNames', :controller => 'read', :action => 'tableOfContents'
  map.books '/books', :controller => 'read', :action => 'listBooks'
  map.books '/edit/:bookNames/:chapter', :controller => 'write', :action => 'writeChapter'
  map.books '/edit/:bookNames', :controller => 'write', :action => 'chooseChapter'
  map.books '/edit', :controller => 'write', :action => 'listBooks'
  map.books '/save/:bookNames/:chapter', :controller => 'write', :action => 'saveChapter'      
  map.books '/save/:bookNames/', :controller => 'write', :action => 'saveBook'
  map.books '/create/newBook', :controller => 'write', :action => 'createBook'
  map.books '/create/newChapter/:bookNames/', :controller => 'write', :action => 'createChapter'
  map.books '/delete/oldBook', :controller => 'write', :action => 'deleteBook'
  map.books '/delete/oldChapter', :controller => 'write', :action => 'deleteChapter'
  map.books '/update/permissions', :controller => 'write', :action => 'updatePermissions'
end
