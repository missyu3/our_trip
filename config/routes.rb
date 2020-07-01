Rails.application.routes.draw do
  root 'tops#show'
  resources :tops, only: [:show]
  resources :plans do
    resources :plan_items
    resources :participants, only: [:index, :create, :destroy]
    resources :schedules, only: [:index]  do 
      collection do
        patch :sort
        patch :add
        delete :remove
      end
    end
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  resources :users, only: [:show]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end