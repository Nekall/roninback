Rails.application.routes.draw do

  resources :users_badges
  devise_for :users,
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }

  resources :badges


end
