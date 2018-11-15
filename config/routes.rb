Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :update, :destroy, :show]
      resources :chatrooms, only: [:show, :update, :create, :destroy]
      resources :messages, only: [:update, :create, :destroy]
      get 'users/:id/messages/sent', to: 'users#sent_messages'
      get 'users/:id/messages/received', to: 'users#received_messages'
      post 'signin', to: 'users#sign_in'
      get 'validate', to: 'users#validate'
      post 'signup', to: 'users#create'
    end
  end
end
