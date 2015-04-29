class WelcomeController < Sinatra::Base
  enable :sessions
  helper Sinatra::SessionHelper

  set :views, File.extend_path('../../views', __FILE__)
  set :public_folder, File.extend_path('../../public', __FILE__)

 ##   ***** Debugging *****
 # get '/pry' do
 #   binding.pry
 # end

    #-_-_-_-_-_-_-_-_-_-_- Routes -_-_-_-_-_-_-_-_-_-_-

  get '/' do
    erb :index
  end

  get '/admin' do
    if current_user
      erb :admin_authenticated
    else
      erb :admin_non_authenticated
    end
  end

end #WelcomeController
