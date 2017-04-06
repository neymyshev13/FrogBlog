Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :authors
    root to: 'blog/posts#index'

    namespace :authors do
      get '/account' => 'accounts#edit', as: :account
      put '/info' => 'accounts#update_info', as: :info
      put '/change_password' => 'accounts#change_password', as: :change_password
      resources :posts do
        put 'publish' => 'posts#publish', on: :member
        put 'unpublish' => 'posts#unpublish', on: :member
      end
    end

    scope module: 'blog' do
      get 'about' => 'pages#about', as: :about
      get 'contact' => 'pages#contact', as: :contact
      get 'posts' => 'posts#index', as: :posts
      get 'posts/new'
      get 'posts/:id' => 'posts#show', as: :post
    end
  end
end
