Rails.application.routes.draw do
  root 'chat_room#index'
  get '/chat', to: 'chat_room#index', as: :chat

  resources :users
  resources :sessions, only: [:new, :create]
  delete '/sessions', to: 'sessions#destroy'
end
