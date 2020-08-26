class SightingsController < ApplicationController

    def show
        sighting = Sighting.find_by(id: params[:id])
        if sighting
            render json: {id: sighting.id, bird: sighting.bird, location: sighting.location}
        else
            render json: {message: 'No sighting found with that id'}
        end
    end

    def index
        sightings = Sighting.all
        render json: sightings.to_json(:include => {
            :bird => {:only => [:name, :species]},
            :location => {:only => [:latitude, :longitude]}
            }, 
            :except => [:updated_at])
    end


end
