Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root to: "devise/sessions#new"
  end

  resources :videos do
    member do 
      get :play
      put :update_views
    end
  end
end
