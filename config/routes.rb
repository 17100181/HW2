Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'movies#index'

  # Example of regular route:
    # get 'movies/:id' => 'movies#edit'

  # Example of named route that can be invoked with purchase_url(id: product.id)

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  # get 'movies/:id' => 'movies#edit', as: :updater
  post 'movies/update' => 'movies#updater', as: :updatefunc
  post 'movies/title' => 'movies#delete_title', as: :delete_title
  post 'movies/rating' => 'movies#delete_rating', as: :delete_rating
  get 'movies/d_title' => 'movies#d_title', as: :d_title
  get 'movies/d_rating' => 'movies#d_rating', as: :d_rating
  get 'movies/delete' => 'movies#delete', as: :delete_movie

  
  resources :movies

  

  # resources:movie do
  #   # collection do
  #     put 'update'
  #   # end
  # end
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
