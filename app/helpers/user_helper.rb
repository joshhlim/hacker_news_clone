module UserHelper

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
