class UsersController < ApplicationController
  def new
  end
<<<<<<< HEAD
=======

  def create 
    @user = User.new(user_params) 
    if @user.save
      # dang nhap khi dang ky
      log_in @user
      flash[:success] = "Create Account Successs"
      redirect_to user_path(@user)
    else 
      render 'new'
    end
  end

  def show 
    @user = User.find(params[:id])
  end

  private 
    def user_params 
      params.require(:user).permit(:name,:email,:password,:password_confirmation,:image)
    end 
>>>>>>> log-in and log-out
end
