Rails.application.routes.draw do
  root to: 'cocktails#new'

  resources :cocktails, only: [:create]

  get '/mail', to: 'cocktails#mail'

  get '/not_valid', to: 'cocktails#not_valid'

  get '/cocktails', to: 'cocktails#reroute'

  ########################

  resources :drinks, only: [:new, :create] do
    collection do
      get :added
      get :invalid
    end
  end

end
