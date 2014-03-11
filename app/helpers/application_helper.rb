module ApplicationHelper
  def current_user
    @user ||= User.get(session[:user_id]) if session[:user_id]
  end
end
