Rails.application.routes.draw do

  resources :resources_technologies
  resources :resources
  resources :users_technologies
  resources :technologies

  devise_for :users,
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }

  resources :users
  resources :badges
  resources :users_badges
  resources :appointments
  resources :privatemessagings do
    resources :messages
  end

end
