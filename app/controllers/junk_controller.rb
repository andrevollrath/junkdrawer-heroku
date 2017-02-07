class JunkController < ApplicationController
  
  get '/junk' do
    #redirect_if_not_logged_in
    erb :'junk/index'    
  end

end