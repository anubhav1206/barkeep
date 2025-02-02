Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :audits
    resources :reagents
    resources :reagent_amounts
    resources :reagent_categories
    resources :recipes
    resources :reference_bottles

    root to: "users#index"
  end
  devise_for :users
  root to: 'home#index'
  resources :recipes
  resources :reagents do
    post :refill
  end
  resources :bulk_reagents, only: [:index, :create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cocktails do
    post :delete
    get :pre_make_drink
    post :make_drink
    post :toggle_favorite
    post :propose_to_share
    post :make_permanent
  end

  resources :drink_making, only: [:show, :update] do
  end

  # TODO: rename these routes
  scope :cocktails_async do
    get :drink_builder, to: 'cocktails#drink_builder'
  end

  resources :shared_cocktails, only: [:index, :show, :destroy] do
    post :add_to_account
    post :promote_to_shared
  end

  resources :shopping, only: [:index]

  resources :audits, only: [:index, :show, :update]

  resources :reagent_categories, only: [:index, :show, :edit, :update, :new, :create]

  resources :reference_bottles, only: [:new, :create, :edit, :update, :destroy]
end
