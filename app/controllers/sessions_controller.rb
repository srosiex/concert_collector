class SessionController < ApplicationController

    get '/login' do
        redirect '/events' if logged_in?
        @failed = false
        erb :'sessions/login'
    end

    post '/login' do
        user = User.find_by(username: params[:username])
        if !!user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect :'/events'
        else
            @failed = true
            erb :'sessions/login'
    end
end

    get '/signup' do 
        redirect '/events' if logged_in?
        erb :'sessions/signup'
    end

    post '/users' do
        @user = User.create(first_name: params[:first_name], username: params[:username], password: params[:password])
        if @user.errors.any?
            erb :'sessions/signup'
        else
            session[:user_id] = @user.id
            redirect '/events'
    end
end

    delete '/logout' do
        session.clear
        redirect to '/'
    end

end