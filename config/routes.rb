Rails.application.routes.draw do

  root to: 'pages#home'

  get '/welcome(/:first_name)', to: 'pages#welcome'
  get '/gossips/:id', to: 'pages#gossips'
  get '/team', to: 'pages#team'
  get '/contacts', to: 'pages#contacts'
  get '/home', to: 'pages#home'

end
