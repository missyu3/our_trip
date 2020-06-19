Rails.application.routes.draw do
  get 'users/show'
  root 'plans#index'
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
  
  devise_for :users, :controllers => {
  :registrations => 'users/registrations',
  :sessions => 'users/sessions'   
  } 

  resources :users, only: [:show]
devise_scope :user do
  get "signup", :to => "users/registrations#new"
  get "login", :to => "users/sessions#new"
  get "logout", :to => "users/sessions#destroy"
end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end