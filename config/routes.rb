Rails.application.routes.draw do
  root'video#new'
  resources :video, only: [:create, :new]

  mount Tus::Server => "/files"
  #see https://github.com/janko-m/tus-ruby-server for documentation
end
