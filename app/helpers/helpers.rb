class Helpers

# finds user in database that matches in inputed username and password
  def current_user
    
      @user = User.find_by(username: params[:username])
  end

  def is_logged_in?

  end

end
