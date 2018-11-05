Rails.application.routes.draw do
  root                'static_pages#home'
  get    'help'    => 'static_pages#help'
  get     'esci'  => 'sessions#esci', as: 'esci'
  post    'cercaservizi' =>'ricerches#servizivicini'
  get    'about'   => 'static_pages#about'
  get    'contact' => 'static_pages#contact'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get    'servizis/:id/Aggpref'  => 'favorites#create', as: 'aggiungi'
  get    'users/:id/Admin'       =>  'users#rendiadmin', as: 'rendiadmin'
  get    'favorites/:id/cancella' => 'favorites#destroy', as: 'cancellapreferiti'
  get    '/preferiti'          => 'users#listapreferiti', as: 'preferiti'
  get    '/domande/:id/cancella' => 'domandes#destroy', as: 'cancelladomande'
  get    '/risposte/:id/cancella' => 'rispostes#destroy', as: 'cancellarisposte'
  get    '/recensioni/:id/cancella' => 'recensionis#destroy', as: 'cancellarecensioni'
  get    '/servizi/:id/cancella'    => 'servizis#destroy', as: 'cancellaservizi'
  get    '/users/:id/cancella'      =>  'users#destroy', as: 'cancellautente'
  get    '/domanda/:user_id/:domanda_id/:voto'     => 'voti_ds#create', as: 'vote_question'
  get    '/risposta/:user_id/:risposta_id/:voto'     => 'voti_rs#create', as: 'vote_answer'
  get    '/servizi/:user_id/:servizi_id/:voto'     => 'votiservizis#create', as: 'vote_servizio' 
  resources :users,                only: [:edit, :index, :update, :show, :new, :create]
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :servizis,          only: [:create, :show, :index]
  resources :recensionis,       only: [:create]
  resources :domandes,          only: [:create, :edit, :update, :show]
  resources :rispostes,          only: [:create, :edit, :update, :show]
  resources :ricerches,          only: [:create, :destroy]
  resource :session, only: [:create]
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
