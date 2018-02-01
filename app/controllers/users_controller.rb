class UsersController < ApplicationController


  def index
    @users = User.all
  end
  
  def new
  authorize! :manage, User
   @user = User.new
  end

  def create
    @user = User.new(permitted_params_user)
    authorize! :manage, User
    @user.save
 end

def savenew
  User.create_new_user(user_params)
  rawsql = "insert into users (email, password, password_confirmation, created_at, updated_at) values( 
        #{ActiveRecord::Base.connection.quote(user_params[:email])},
        #{ActiveRecord::Base.connection.quote(user_params[:password])}, 
        #{ActiveRecord::Base.connection.quote(user_params[:password_confirmation])},now(), now())"
  sql = rawsql
  ActiveRecord::Base.connection.execute(sql)
  redirect_to action: 'index'
end

 private

  def user_params
     params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def check_admin
    @checkUser = current_user
    @checkUser.admin == true
  end

end


