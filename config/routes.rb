Rails.application.routes.draw do
	resources :users, only: [:create, :show, :update, :destroy]
  resources :channels, except: [:new, :edit] do
    resources :inputs, only: [:index, :new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
