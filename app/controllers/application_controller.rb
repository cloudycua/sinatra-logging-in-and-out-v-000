require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

# contains form for user to log in
  get '/' do
    erb :index
  end



# displays correct username and balance based on session
# displays a 'Log Out' link
  post '/login' do
  # finds user in database that matches in inputed username and password  
    @user = User.find_by(username: params[:username])
  # sets session user id to database user id  
    session[:user_id] = @user.id
  end

  get '/account' do

  end

  get '/logout' do

  end


end
