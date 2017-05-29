class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def logged_in?
    !!session['user_id']
  end

  def current_user
    User.find(session['user_id'])
  end

  def find_user
    if logged_in?
      @user = current_user
    else
      @user = User.new
    end
  end

end
