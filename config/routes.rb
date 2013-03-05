Forum::Application.routes.draw do
  devise_for :users

  resources :sections, shallow: true do
    resources :posts do
      resources :comments
    end
  end

  resources :users

  root :to => 'sections#index'
end
