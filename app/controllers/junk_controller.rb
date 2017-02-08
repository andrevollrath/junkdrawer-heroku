class JunkController < ApplicationController
  
  #Shows everyone's public junk!
  get '/junk' do
    redirect_if_not_logged_in
    @junk = Junk.all
    erb :'junk/index'    
  end

  get '/junk/new' do
    redirect_if_not_logged_in
    erb :'junk/new'
  end

  get '/junk/:id/edit' do
    redirect_if_not_logged_in
    @junk = Junk.find(params[:id])
    
    if session[:user_id] == @junk.user_id
      erb :'junk/edit'      
    else
      redirect to '/junk'
    end
  end

  get '/junk/:id' do
    redirect_if_not_logged_in
    @junk = Junk.find(params[:id]) 
    @user_id = session[:user_id] 
    erb :'junk/show'
  end

  patch '/junk/:id' do
    if Junk.no_params(params)
      redirect to "/junk/#{params[:id]}/edit"
    else 
      junk = Junk.find(params[:id])
      junk.update!(params[:junk])
      junk.tag = Tag.find_or_create_by(name: params[:tag])
      junk.save      
      redirect to "/junk/#{junk.id}"
    end
  end
  
  post '/junk' do
    #Check for content requirements
    if Junk.no_params(params)
      redirect to "/junk/new"
    else
      #binding.pry
      junk = Junk.create(params[:junk])
      
      junk.tag = Tag.find_or_create_by(name: params[:tag])
      junk.user = User.find(session[:user_id])      
      junk.image = params[:image] if params[:image]

      junk.save
      redirect to "/junk/#{junk.id}"
      #redirect to "/junk/new"
    end
  end

  delete '/junk/:id/delete' do
    redirect_if_not_logged_in
    junk = Junk.find(params[:id])
    
    junk.delete if session[:user_id] == junk.user_id
    redirect to '/junk'
  end
end