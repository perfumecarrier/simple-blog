class UsersController < ApplicationController

  def new; end

  def register; end

  def login
    @user = User.find_by(email: user_params[:email].downcase)
    if @user
      if @user.authenticate(user_params[:password])
        session[:user_id] = @user.id
        flash[:notice] = 'Welcome back'
        redirect_to root_path
      else
        flash.now[:alert] = 'Email or Password is incorrect'
        render :new, status: :unprocessable_entity
      end
    else
      flash.now[:alert] = 'User does not exist'
      render :new, status: :unprocessable_entity
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome #{@user.name}"
      redirect_to root_path
    else
      flash.now[:errors] = @user.errors.full_messages
      render :register, status: :unprocessable_entity
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
