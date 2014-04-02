Training::Application.routes.draw do
  resources :buildings

  resources :notification_receivers
  resources :notifications do
    collection do
     post 'send_notification'

    end
end

  resources :tsessions do
    member do
      get 'session_info'
    end

  end

  resources :sessions

  resources :subjects

  resources :rooms

  resources :loolops

  resources :member_classes

  resources :courses

  resources :training_classes

  get "users/show"
  resources :users
 resources :sessions, only: [:new, :create, :destroy]
  #get "users/new"
  root  'static_page#home'
  
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
   
  match '/help',    to: 'static_page#help',    via: 'get'
  #match '/help' => 'static_pages#help' ,   via: 'get'
  match '/about',   to: 'static_page#about',   via: 'get'
  match '/contact', to: 'static_page#contact', via: 'get'

  #match '/home', to: 'static_page#home', via: 'get'

  match '/index',   to: 'training_classes#index',   via: 'get'
  #match '/index' to: 'member_classes#index', via: 'get'  
  #match 'member_classes/addmember' => 'member_classes#addmember', :via => :post
  post 'member_classes/addmember' => 'member_classes#addmember'
  
  get "static_page/home"
  get "static_page/help"
  get "static_page/about"
  get "static_page/contact"

  post 'create_notification'=>'notifications#create_notification'
  post 'notification_receivers/update_notification'=>'notification_receivers#update_notification'
  #get 'tsessions/session_info'=>'tsessions#session_info'
  #post 'notifications/send_notification'=>'notifications#send_notification'
  #get "training_classes/index"
  #get "sessions/logout" 
  #get "static_page/signup"

  
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
