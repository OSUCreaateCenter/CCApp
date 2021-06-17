Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root "home#top"
  resources :categories do
    # get 'content/:content_id',to: "content#download",as: "download"
    resources :contents do
      member do
        get :download
      end
    end
  end
  
end