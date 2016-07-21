Rails.application.routes.draw do
  
  resources :links do 
    member do 
        get "like", to: :upvote 
        get "dislike", to: :downvote
      end
  end

  # get 'goto/:link_id', to: 'navigate#goto', as: :goto

  root to: "links#index" 

  get 'auth/:provider/callback', to: "sessions#create"

  get 'sign_out', to: "sessions#destroy", as: 'sign_out'
end
