Rails.application.routes.draw do
  root 'plans#index'
  patch 'plans/:id/sort', to: 'plans#sort'
  patch 'plans/:id/add', to: 'plans#add'
  delete 'plans/:id/remove', to: 'plans#remove'
  resources :plans do
    resources :plan_items
    resources :schedules, only: [:index , :create]
  end
  devise_for :users, :controllers => {
  :registrations => 'users/registrations',
  :sessions => 'users/sessions'   
  } 

devise_scope :user do
  get "user/:id", :to => "users/registrations#detail"
  get "signup", :to => "users/registrations#new"
  get "login", :to => "users/sessions#new"
  get "logout", :to => "users/sessions#destroy"
end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end