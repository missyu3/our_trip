# frozen_string_literal: true

Rails.application.routes.draw do
  get 'comments/create'
  root 'tops#show'
  resources :tops, only: [:show]
  resources :plans do
    resources :plan_items do
      resources :comments, only: [:index, :create]
    end
    resources :participants, only: [:index, :create, :destroy]
    resources :schedules, only: [:index] do
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

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
