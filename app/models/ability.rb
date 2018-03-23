class Ability
  include CanCan::Ability

  def initialize(user)

   user ||= User.new 
      if user.role == "superadmin"
       can :manage, :all
      else
        if user.role == "admin"
         can :manage, Reservacion
         can :manage, Calendario
         can :manage, Welcome
        end
      end
      if user.role == "videoconferencias"
        can :manage, Videoconferencium
        can :manage, Welcome
      end
      if user.role == "usuario"
        can :show, Reservacion
      end
      if user.role == "usuarioV"
        can :show, Videoconferencium
      end
  end
end
