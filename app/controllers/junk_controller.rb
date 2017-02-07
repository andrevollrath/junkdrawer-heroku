class JunkController < ApplicationController
  
  get '/junk' do
    redirect_if_not_logged_in
    erb :'junk/index'    
  end

  get '/junk/new' do
    redirect_if_not_logged_in
    erb :'tweets/new'
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
    erb :'junk/show'
  end

  patch '/junk/:id' do
    if params[:content].empty?
      redirect to "/junk/#{params[:id]}/edit"
    else 
      #find and update junk
      redirect to "/junk/#{tweet.id}"
    end
  end

  post '/junk' do
    if params[:content].empty? 
      redirect to "/junk/new"
    else
      ##Create Junk
      redirect to "/junk/#{junk.id}"
    end
  end

  delete '/tweets/:id/delete' do
    redirect_if_not_logged_in
    junk = Junk.find(params[:id])
    
    junk.delete if session[:user_id] == junk.user_id
    redirect to '/junk'
  end
end