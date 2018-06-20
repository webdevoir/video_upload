Rails.application.routes.draw do
  root'upload_form#index'
  get 'upload_form/index'

  mount Tus::Server => "/files"
  #see https://github.com/janko-m/tus-ruby-server for documentation
end
