class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.create(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation]) 
    #@user = User.new(user_params)
    #@user.password = params[:password]
    @user.save
    redirect_to '/login'
  end 

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation) 
    end 
end
