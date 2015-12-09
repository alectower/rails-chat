Rails.application.routes.draw do
  root 'chat_room#index'
  get '/chat', to: 'chat_room#index'
end
