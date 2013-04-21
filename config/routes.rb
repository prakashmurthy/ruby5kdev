Ruby5kdev::Application.routes.draw do
  match 'contact_us' => 'misc#contact_us', :as => :contact_us

  devise_for :users

  resources :entries

  root :to => 'entries#index'
end
