module SessionsHelper
  # Remembers a user in a persistent session.
  def remember(user)
    # user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # Returns the current logged-in user (if any).
  def current_user
    return unless (user_id = cookies.signed[:user_id])

    # puts "current id is : #{cookies[:remember_token]}"
    user = User.find_by(id: user_id)
    return unless user&.authenticated?(cookies[:remember_token])

    # puts "user was authenticated"
    current_user_equal(user)
  end

  def current_user_equal(user)
    @current_user = user
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  # Logs out the current user.
  def log_out
    # session.delete(:user_id)
    cookies.signed[:user_id] = nil
    cookies[:remember_token] = nil
    @current_user = nil
  end
end
