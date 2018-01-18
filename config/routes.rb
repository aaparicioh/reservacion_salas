Rails.application.routes.draw do
  
  resources :servicios
  resources :reservacions
  resources :usuarios
  resources :solicituds
  resources :welcome
  resources :calendario
  resources :solicitud
  resources :reservacion
  resources :espacios
  devise_for :users
  
    resources :reservacions do
    get :get_events, on: :collection
    end
  root 'welcome#solicitud'

  get 'solicitud/espera'
  post 'solicitud/espera'

  get 'formulario/principal'

  get 'welcome/solicitud'
  post 'welcome/solicitud'

  get 'welcome/administracion'
  post 'welcome/administracion'
   
  get 'calendario/espacios'
  get 'solicituds/index'
  get 'reservacion/index'
  
  get 'espacios/auditorio4P'
  post 'espacios/auditorio4P'

  get 'espacios/sala15P'
  post 'espacios/sala15P'
 
  get 'espacios/sala25P'
  post 'espacios/sala25P'
 
  get'espacios/auditorioRG'
  post 'espacios/auditorioRG'

  get 'espacios/sala6P'
  post 'espacios/sala6P'
 
  get 'espacios/salaPosg'
  post'espacios/salaPosg'

  get 'espacios/espacioAdic'
  post 'espacios/espacioAdic'

  get 'reservacions/new'
get 'reservacions/show'
  get 'reservacions/get_reservacion'
  get 'devise/index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
