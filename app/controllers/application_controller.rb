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

# sets session user id to id of user from database
  post '/login' do
    @user = User.find_by(username: params[:username])
    session[:user_id] = @user.id
  end

  get '/account' do

  end

  get '/logout' do

  end


end
