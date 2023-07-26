Rails.application.routes.draw do
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    root to: "homes#top"
    get "/home/about" => "homes#about", as: "about"
    resources :items, only: [:index, :show]
    get "/customers/:id/unsubscribe" => "customers#unsubscribe", as: 'customers/unsubscribe'
    patch "/customers/:id/withdraw" => "customers#withdraw", as: 'customers/withdraw'
    resources :customers, only: [:show, :edit, :update]
    
    resources :items, only: [:index, :show]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :update, :destroy, :create]

    post 'orders/confirm' => "orders#confirm"
    get 'orders/complete' => "orders#complete"
    resources :orders, only: [:new, :create, :index, :show]

    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end

  namespace :admin do
    root to: "homes#top"
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
