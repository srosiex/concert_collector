class EventsController < ApplicationController


    get '/events/new' do 
        authenticate
        erb :'events/new'
    end

    post '/events' do
        authenticate
            u = current_user
             @event = u.events.build(artist: params[:artist], date: params[:date], venue: params[:venue], location: params[:location], url: params[:url])       
                                          
             if u.save
                redirect to '/events'
            else
                erb :'events/new'
            end
        end

        get '/events' do
            authenticate
            @events = Event.all 
            # @sorted = @events.sort_by { |e| e.artist.downcase }
            @sorted = @events.order(date: :desc)
            erb :'/events/index'
    end

        get '/events/my_events' do
            authenticate
            erb :'events/my_events'
        end


    delete '/events/:id' do
        event = Event.find_by(id: params[:id])
            if event
                event.destroy
                redirect '/events'
            end
    end

    get '/events/:id/edit' do
        @event = Event.find_by(id: params[:id])
        authenticate_user(@event)
        if @event
            erb :'/events/edit'
        else
            erb :'/index'
        end
    end 

    patch '/events/:id' do 
        @event = Event.find_by(id: params[:id])
        authenticate_user(@event)
            @event.update(artist: params[:artist], date: params[:date], venue: params[:venue], location: params[:location], url: params[:url])
            redirect '/events'
        end
    end
