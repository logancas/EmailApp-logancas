Rails.application.routes.draw do
  resources :emails
  resources :users, :except => [:index]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/users/:id/outbox', to: 'users#sent_emails'
  root 'welcome#index'
  get '/inbox', to: 'emails#inbox'
  get '/outbox', to: 'emails#outbox'
  get '/drafts', to: 'emails#drafts'
end
