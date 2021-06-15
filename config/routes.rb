Rails.application.routes.draw do
  
  resources :users_technologies
  resources :technologies
  devise_for :users,
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }

  resources :badges
  resources :users_badges
  resources :privatemessagings

end
