Rails.application.routes.draw do
  get 'expenses/new'

  get 'expenses/create'

  get 'expenses/edit'

  get 'expenses/update'

  get 'expenses/destroy'

  root 'home#index'

  get '/dashboard' => 'home#dashboard'

  resources :users, except: [:edit, :destroy] do
    get 'edit' => 'profiles#edit'
  end

  post 'profile' => 'profiles#update'

  resources :trips, except: :destroy do
    resources :expenses
  end

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  post '/invite' => 'users_trips#invite'
  post '/accept' => 'users_trips#accept'
  delete '/decline' => 'users_trips#destroy'

  post 'expense/accept' => 'users_expenses#accept'
  post 'expense/pay' => 'users_expenses#pay'
  post 'expense/confirm' => 'users_expenses#confirm'

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
