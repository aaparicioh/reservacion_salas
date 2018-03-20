class Ability
  include CanCan::Ability

  def initialize(user)

   user ||= User.new 
      if user.role == "superadmin"
       can :manage, :all
      end
        if user.role == "admin"
         can :manage, Reservacion
         can :manage, Espacio
         can :manage, Videoconferencium
        end

          if user.role == "videoconferencias"
             can :manage, Videoconferencium
          end
           if user.role == "usuario"
           can :show, Reservacion
           
           end
  end
end
