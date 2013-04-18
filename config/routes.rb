Ruby5kdev::Application.routes.draw do
  devise_for :users

  resources :entries

  root :to => 'entries#index'
end
