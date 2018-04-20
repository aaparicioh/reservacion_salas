Rails.application.routes.draw do
  
  resources :reservacions
  resources :welcome
  resources :calendario
  resources :reservacion
  resources :espacios
  resources :videoconferencia
  devise_for :users
  resources :users
  
  
  root 'welcome#solicitud'

  get 'welcome/solicitud'
  post 'welcome/solicitud'
  get 'users/new'
  get 'users/edit'

  get 'welcome/administracion'
  post 'welcome/administracion'
   
  get 'calendario/espacios'
  post 'calendario/espacios'

  post 'calendario/salaVideoconferencia'

  post 'calendario/actividadesInvestigacion'
  
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


  get 'espacios/salaVideoconferencias'
  post 'espacios/salaVideoconferencias'

  get 'reservacions/new'
  get 'reservacions/show'

  post '/reservacions/actividadesInvestigacion', to: 'reservacions#show'
  post '/reservacions/id', to: 'reservacions#show'
  post '/videoconferencia/id',  to: 'videoconferencia#show'

 
 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
