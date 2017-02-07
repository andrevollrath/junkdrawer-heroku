class UsersController < ApplicationController
  
  get '/signup' do
    if logged_in?
      redirect to '/junk'    
    else
      erb :'users/new'
    end
  end

  post '/signup' do
    if User.invalid_params(params)
      redirect to '/signup'
    else
      @user = User.create(username: params[:username], 
        email: params[:email], password: params[:password])
      
      session[:user_id] = @user.id
      redirect to '/junk'      
    end
  end

  get '/login' do
    if logged_in?
      redirect to '/junk'  
    else
      erb :'users/login'
    end
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/junk"
    else
      redirect to '/signup'
    end    
  end

  get '/logout' do
    if logged_in?
      session.destroy
    end 
      redirect to '/'
  end

end 