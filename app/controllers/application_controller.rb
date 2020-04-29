class ApplicationController < Sinatra::Base

configure do
    set :views, 'app/views'
    set :public_folder, 'public'
    enable :sessions
    set :session_secret, 'password_secure'
end

    run

    get '/' do
        erb :index
    end

    helpers do
        

        def logged_in?
            !!session[:user_id]
        end

        def current_user
            User.find_by(id: session[:user_id])
        end

        def authenticate
            if !logged_in?
                redirect '/login'
        end
    end
 
    def authenticate_user(event)
        authenticate
        redirect '/index' if @event && current_user != @event.user
    end
       
  
    
end
end