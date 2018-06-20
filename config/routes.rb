Rails.application.routes.draw do
  get 'upload_form/index'
  root'upload_form#index'

  #see https://github.com/janko-m/tus-ruby-server for documentation
  mount Tus::Server => '/files'
end
