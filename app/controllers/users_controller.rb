class UsersController < ApplicationController
  
  get '/users/:id' do
    redirect_if_not_logged_in
    @user = User.find(params[:id])
    erb :'users/show'
  end

  get '/signup' do
    logged_in? ? (redirect to '/junk') :  (erb :'users/new')
  end

  post '/signup' do
    if User.invalid_params(params[:user])
      redirect to '/signup'
    else
      @user = User.create(params[:user])
      session[:user_id] = @user.id
      redirect to '/junk'      
    end
  end

  get '/login' do
    logged_in? ? (redirect to '/junk') :  (erb :'users/login')
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
      session.destroy if logged_in?
      redirect to '/'
  end

end 