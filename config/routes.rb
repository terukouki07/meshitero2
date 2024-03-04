Rails.application.routes.draw do
  devise_for :users
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resources :post_comments, only: [:create, :destroy]
    resource :favorite, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update] do
		resource :relationships, only: [:create, :destroy]
		get 'followings' => 'relationships#followings', as: 'followings'
		get 'followers' => 'relationships#followers', as: 'followers'
	end
  root to: 'homes#top'
  get "homes/about" => "homes#about", as: "about"
  get "search" => "searches#search"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
