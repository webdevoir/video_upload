Rails.application.routes.draw do
  root'video#new'
  resources :video, only: [:create, :new]

   mount Shrine.uppy_s3_multipart(:cache) => "/s3"
end
