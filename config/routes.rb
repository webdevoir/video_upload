Rails.application.routes.draw do
  root'video#new'
  resources :video, only: [:create, :new]

  mount Shrine.presign_endpoint => "presign"
  #see https://github.com/janko-m/tus-ruby-server for documentation
end
