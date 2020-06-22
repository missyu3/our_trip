Rails.application.routes.draw do
  root 'tops#show'
  resources :tops, only: [:show]
  resources :plans do
    resources :plan_items
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

  resources :users, only: [:show]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end