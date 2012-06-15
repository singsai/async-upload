CarrierwaveMultiFileUpload::Application.routes.draw do
    root :to            => 'pages#home'


    resources :galleries do
      resources :photos, :except => [:update, :edit] do
        resources :avatars#, :except => [:update, :edit] 
      end
    end         

    match '/galleries/:gallery_id/photos/:photo_id/avatars' => 'avatars#index'
    match '/galleries/:gallery_id/photos/:photo_id/avatars/new' => 'avatars#new'
    #match '/galleries/:id/photos/:photo_id/' => 'photos@show'
    #match '/galleries/:gallery_id/photos/:photo_id/avatars/:id' => 'avatars#show'
    #match '/galleries/:gallery_id/photos/:photo_id/avatars/:id(.:format)' => 'avatars#destroy'
    
    # match '/galleries/:id/photos/:id/avatars/create' => 'avatars#create'
    # match '/galleries/:id/photos/:id/avatars/index' => 'avatars#index'
end