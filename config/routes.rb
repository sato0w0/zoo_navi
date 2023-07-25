Rails.application.routes.draw do

  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  devise_scope :user do
    post "users/guest_sign_in", to: "public/sessions#guest_sign_in"
  end

  namespace :admin do
    get '/' => 'homes#top'
    resources :zoos,         only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      resource :zoo_animals, only: [:create, :destroy]
    end
    resources :animals,      only: [:index, :show, :new, :create, :edit, :update]
    resources :animal_types, only: [:index, :create, :edit, :update]
    resources :users,        only: [:index, :show, :edit, :update] do
      resources :zoo_reviews, only: [:index, :show, :new, :edit, :create, :destroy, :update] do
        resources :review_comments, only: [:create, :destroy]
      end
    end
  end

  scope module: :public do
    root :to                       => 'homes#top'
    get   'home/about'             => 'homes#about'
    get   'users/withdraw_confirm' => 'users#withdraw_confirm'
    patch 'users/withdraw'         => 'users#withdraw'
    get   'users/information'      => 'users#show',   as: 'user'
    get   'users/information/edit' => 'users#edit',   as: 'edit_user'
    patch 'users/information'      => 'users#update', as: 'update_user'
    resources :animals, only: [:index, :show]
    resources :zoos,    only: [:index, :show] do
      resources :zoo_reviews, only: [:index, :show, :new, :edit, :create, :destroy, :update] do
        resources :review_comments, only: [:create, :destroy]
      end
    end
    get '/search', to: 'searches#search'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
