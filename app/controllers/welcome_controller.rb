class WelcomeController < ApplicationController
  protect_from_forgery
  before_action :authenticate_user! 
 

  def show
  	render 'welcome/solicitud'
  end

  def login
  	
  	solicituds[:usuario_id] = nil
    solicituds[:admin] = nil
    @usuario = Usuarios.new
  end

end
