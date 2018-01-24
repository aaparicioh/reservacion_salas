class UsersController <  ApplicationController
 before_action :check_admin, only: [:index]

  def index
    @users = Users.all.order('LOWER(username)')
  end

  def new_user
  authorize! :manage, User
   @user = Users.new
  end
  
  def create
    @user = User.new(permitted_params.user)
    authorize! :manage, User
    if @user.save
     #success
    else
     #error
    end

 end


  private

  def check_admin
    @checkUser = current_user
    @checkUser.admin == true
  end

end

end
