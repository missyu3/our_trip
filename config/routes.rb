Rails.application.routes.draw do
  root 'plans#index'
  resources :plans
  devise_for :users
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
