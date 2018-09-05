Rails.application.routes.draw do
  root'video#new'
  resources :video, only: [:create, :new]

  mount Shrine.presign_endpoint(:cache), at: '/presign'
end
