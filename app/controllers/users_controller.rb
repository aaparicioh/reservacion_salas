class UsersController < ApplicationController

  def index
    @users = User.all
  end
  
  def new
   @user = User.new
  
  end
  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.save

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Se registró un nuevo usuario satisfactoriamente.' }
        format.json { render :index, status: :created, location: @user}
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
 end

  def show
  @user = User.find_by_id(params[:id])
  end
 
 def edit
  @user= User.find_by_id(params[:id])
 end

 def update
  @user= User.find_by_id(params[:id])

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'La información del siguiente usuario fue actualizada satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find_by_id(params[:id])
    @user.destroy
      redirect_to users_path, :notice => "El usuario fue eliminado satisfactoriamente."
  
  end

 private

  def user_params
     params.require(:user).permit(:id, :email, :password, :password_confirmation, :role)
  end

end


