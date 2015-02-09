Rails.application.routes.draw do
  

  scope module: 'api' do
    scope '/api' do
    scope '/users' do
    end
    
    scope '/boards' do
      get '/' => 'boards#index'
      post '/' => 'boards#create'
      scope '/:board_id' do
        get '/' => 'boards#show'
        put '/' => 'boards#update'
        delete '/' => 'boards#destroy'

        scope '/tasks' do
          get '/' => 'tasks#index'
          post '/' => 'tasks#create'
          scope '/:task_id' do
            get '/' => 'tasks#show'
            put '/' => 'tasks#update'
            delete '/' => 'tasks#destroy'
          end
        end
      end
    end
  end
end

  root to: "home#show"

  devise_for :api_users

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]


  get 'contact', to: 'contacts#new', as: 'contact'
  resources "contacts", only: [:new, :create]


  resources :users do #, shallow: true do
    member do
      get :delete
    end
  end

  resources :boards, except: [:show] do
    collection do
      post :sort
    end

    member do
      get :delete
    end

    resources :tasks do
      collection do
        post :sort
      end
      member do
        get :delete
      end
    end
  end






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
