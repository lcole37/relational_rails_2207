Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get '/flights', to: 'flights#index'
  get '/flights/new', to: 'flights#new'
  get '/flights/:id', to: 'flights#show'

  get '/passengers', to: 'passengers#index'
  get '/passengers/:id', to: 'passengers#show'

  post '/flights', to: 'flights#create'
  get '/flights/:id/edit', to: 'flights#edit'
  patch '/flights/:id', to: 'flights#update'

  get '/flights/:flight_id/passengers', to: 'flight_passengers#index'
  get '/flights/:flight_id/passengers/new', to: 'flight_passengers#new'
  post '/flights/:flight_id/passengers', to: 'flight_passengers#create'
end
