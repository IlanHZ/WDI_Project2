helpers do
  #method
  def current_user
    #variable
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def is_logged_in?
    #we call the method, turn it to a boolean
    !!current_user
  end

  def authorize!
    unless is_logged_in?
      flash[:danger] = "You must log in to view this page!"
      redirect '/login'
    end
  end

end