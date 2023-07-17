Rails.application.routes.draw do
  # 顧客用
  # URL /users/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get '/' => 'homes#top'
    resources :zoos,          only: %i(index show new create edit update) do
      resource :zoo_animals, only: [:create, :destroy]
    end
    resources :animals,       only: %i(index show new create edit update)
    resources :animal_types,  only: %i(index create edit update)
    resources :users,         only: %i(index show edit update)
  end

  scope module: :public do
    root :to => 'homes#top'
    get   'users/information'       =>  'users#show',   as: 'user'
    get   'users/information/edit', to: 'users#edit',   as: 'edit_user'
    patch 'users/information',      to: 'users#update', as: 'update_user'
    get    'animals/search'                =>  'animals#search'
    get    'zoos/search'                =>  'zoos#search'
    resources :zoos, only: [:index, :show] do
      resources :zoo_reviews, only: [:index, :show, :edit, :create, :destroy, :update] do
        resources :review_comments, only: [:create, :destroy]
      end
    end
    resources :animals,       only: %i(index show)
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
