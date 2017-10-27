class WelcomeController < ApplicationController
  def show


  end

  def login
    solicituds[:usuario_id] = nil
    solicituds[:admin] = nil
    @usuario = Usuarios.new
  end

end
