Rails.application.routes.draw do
  
  resources :ressources
  devise_for :users,
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }

  resources :badges
  resources :users_badges
  resources :privatemessagings

end
