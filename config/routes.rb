Ruby5kdev::Application.routes.draw do
  resources :entries

  root :to => 'entries#new'
end
