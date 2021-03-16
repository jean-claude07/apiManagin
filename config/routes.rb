Rails.application.routes.draw do
  resources :reponsequestiondebutants
  resources :choixquestiondebutants
  resources :questiondebutants
  resources :plusinfos
  resources :inforecruteur
  resources :recruteurs
  resources :candidatprofiles
  resources :contacts
  resources :chauffeurs
  resources :annonces
  resources :admins
  get '/annonce', to: 'annonces#tousLeMonde'
  post '/login', to: 'admins#login'
  post '/sessionChauffeur', to: 'candidatprofiles#sessionChauffeur'
  post '/forgot', to: 'candidatprofiles#forgot'
  post '/sessionRecruteur', to: 'recruteurs#sessionRecruteur'
  post '/mdp', to: 'recruteurs#mdp' 
  get '/notification', to: 'contacts#notif'
  get '/question', to: 'questiondebutants#concept'
  get 'recruteur_annonce', to: 'recruteurs#annonce'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
