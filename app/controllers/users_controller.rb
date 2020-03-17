class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  def create
    @user = User.create(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation]) 
    #@user = User.new(user_params)
    #@user.password = params[:password]
    
    if @user.valid?
      @user.save
      redirect_to '/login'
    else
      flash[:danger] = 'Invalid email/password combination'
      render "new"
    end
  end 

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end 

  # private
  #   def user_params
  #     params.require(:user).permit(:name, :email, :password, :password_confirmation) 
  #   end 
end
