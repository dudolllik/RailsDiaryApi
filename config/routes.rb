require 'sidekiq/web'

Rails.application.routes.draw do
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == ENV["SIDEKIQ_LOGIN"] && password == ENV["SIDEKIQ_PASSWORD"]
  end
  mount Sidekiq::Web => '/sidekiq'
  resources :diaries
  resources :notes
end

