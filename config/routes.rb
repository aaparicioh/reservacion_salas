Rails.application.routes.draw do
  resources :reservacions
  resources :usuarios
  resources :solicituds
  resources :welcome
  resources :calendario
  resources :solicitud
  resources :reservacion
  resources :espacios

   root 'welcome#bienvenida'

  get 'solicitud/espera'
  post 'solicitud/espera'

  get 'formulario/principal'

  get 'welcome/solicitud'
  
   
  
  get 'calendario/calendario'
  get 'solicituds/index'
  get 'reservacion/index'
  get 'espacios/auditorio4P'
  post 'espacios/auditorio4P'
  get 'espacios/sala15P'
 post 'espacios/sala15P'
  get 'espacios/sala25P'
  get'espacios/auditorioRG'
  get 'espacios/sala6P'
  get 'espacios/salaPosg'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
