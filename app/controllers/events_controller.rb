class EventsController < ApplicationController

    get '/events' do
        authenticate
        @events = Event.all 
        erb :'/events/index'
end
    get '/events/new' do 
        authenticate
        erb :'events/new'
    end

    post '/events' do
        authenticate
            u = current_user
            @new_event = u.events.build(artist: params[:artist], venue: params[:venue], location: params[:location])
            @slug = "#{@new_event.artist}".gsub(' ','+')
            url = "https://www.last.fm/music/" + @slug
            Scraper.image_url(url)
            # @artist = Event.all.find_by(artist: params[:artist])
            # url = "https://www.last.fm/music/" + @artist.gsub(' ','+')
            if u.save
                redirect to '/events'
            else
                erb :'events/new'
            end
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
            @event.update(artist: params[:artist], venue: params[:venue], location: params[:location])
            redirect '/events'
        end
    end
