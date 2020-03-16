class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      puts 'hello world'
      remember user
      log_in user
      redirect_to '/'
    else
    # If user's login doesn't work, send them back to the login form.
    flash[:danger] = 'Invalid email/password combination' # Not quite right!
    render '/login'
    end
  end
end
