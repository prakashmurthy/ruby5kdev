Ruby5kdev::Application.routes.draw do
  match 'contact_us' => 'misc#contact_us', :as => :contact_us
  match 'newcomers'  => 'misc#newcomers',  :as => :newcomers

  devise_for :users
  resources  :users

  resources :entries do
    resources :comments
  end

  root :to => 'entries#index'

  namespace :admin do
    root :to => 'base#index'
    resources :users
  end
end
