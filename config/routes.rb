Rails.application.routes.draw do


  

  # root to: "hospitals#index"
  resources :hospitals  do
    resources :reservations, except: [:show,:update]
  end
  
  root  to: 'hospitals#top'
  
  

  

  Rails.application.routes.draw do
    devise_for :doctors, controllers: {
      sessions: 'doctors/sessions',
      passwords: 'doctors/passwords',
      registrations: 'doctors/registrations'
    }
  
    devise_for :users, controllers: {
      sessions: 'users/sessions',
      passwords: 'users/passwords',
      registrations: 'users/registrations'
    }
  end
end
