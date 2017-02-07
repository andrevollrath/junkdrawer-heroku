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

end 