Rails.application.routes.draw do
  root 'pages#home'

  resources :articles
  resources :categories, except: [:destroy]
  resources :users,      except: [:new]

  get 'about',  to: 'pages#about'
  get 'signup', to: 'users#new'

  # Sessions are a non-restful resource.
  get 'login',  to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
