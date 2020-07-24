class BirdsController < ApplicationController
  def index
    birds = Bird.all
    # redid this to render only relevant elements
    # render json: birds
    # have to do it with only: for an array of hashes (vs. just a single hash)
    render json: birds, only: [:id, :name, :species]
    # or could use
    # render json: birds, except: [:created_at, :updated_at]
    # or could use
    # render json: birds.to_json(except: [:created_at, :updated_at])
  end

  def show
    bird = Bird.find_by(id: params[:id])
    # adding if else statement to handle error message for invalid endpoints
      if bird
        render json: { id: bird.id, name: bird.name, species: bird.species }
      else
      # redid this to render only relevant elements
      # render json: bird
        render json: {id: bird.id, name: bird.name, species: bird.species }
      # or could use
      # render json: bird.slice(:id, :name, :species)
      end
    end
end