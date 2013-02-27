Forum::Application.routes.draw do
  resources :sections do
    resources :posts do
      resources :comments
    end
  end

  resources :users

  root to: ' sections#index'
end
