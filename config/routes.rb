Rails.application.routes.draw do
  resources :reservacions
  resources :usuarios
  resources :espacios
  resources :solicituds
  get 'solicitud/espera'
  post 'solicitud/espera'

  get 'formulario/principal'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
