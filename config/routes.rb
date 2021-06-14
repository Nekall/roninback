Rails.application.routes.draw do
  resources :privatemessagings
  devise_for :users,
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }
end
