Rails.application.routes.draw do
  namespace :admin do
    resources :order_details, only: [:update]
    get 'top' => 'homes#top', as: 'top'
    resources :orders, only: [:show, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about', as: 'about'
    resources :delivery_addresses, only: [:index, :create, :edit, :update, :destroy]
    resources :items, only: [:index, :show]
    resources :orders, only: [:index, :show, :new, :create]
    post 'orders/check'
    get 'orders/success'
    resources :cart_items, only: [:index, :create, :update, :destroy]
    delete 'cart_items/destroy_all'
    get 'customers/my_page' => 'customers#show', as: 'my_page'
    get 'customers/inormation/edit' => 'customers#edit', as: 'customers_edit'
    patch 'customers/update' => 'customers#update', as: 'customers_update'
    get 'customers/check' => 'customers#check', as: 'customers_check'
    patch 'customers/withdrawal' => 'customers#withdrawal', as: 'customers_withdrawal'
  end

  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
