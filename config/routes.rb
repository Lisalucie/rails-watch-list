Rails.application.routes.draw do
  #   resources :movie, only: [:show]
  root to: 'lists#index'
  resources :lists, only: [:index, :show, :create, :new] do
    resources :bookmarks, only: [:destroy, :create, :new]
  end
end
