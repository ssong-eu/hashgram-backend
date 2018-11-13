Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :update, :create, :destroy, :show]
      resources :chatrooms, only: [:show, :update, :create, :destroy]
      resources :messages, only: [:update, :create, :destroy]
      get 'users/:id/messages/sent', to: 'users#sent_messages'
      get 'users/:id/messages/received', to: 'users#received_messages'
    end
  end
end
