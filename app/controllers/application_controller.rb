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

  post '/login' do
  # finds user in database that matches in inputed username and password
    @user = User.find_by(:username => params[:username])
  # if a login and password have been submitted and the user password matches the database
    if @user != nil && @user.password == params[:password]
  # then the session user id is set to match the database user id
      session[:user_id] = @user.id
  # and user is redirected to the account page view
      redirect to '/account'
    end
  # otherwise sent to error page to reinput login info  
    erb :error
  end

  get '/account' do
  # displays correct username and balance based on session
  # displays a 'Log Out' link
    erb :account
  end

  get '/logout' do
  # clears session
    session.clear
  # redirects to homepage
    redirect '/'
  end


end
