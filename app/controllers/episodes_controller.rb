class EpisodesController < ApplicationController

    before_action :authorized, only: [:updated]


    def create
        episode = Episode.find_by_trackId(params[:trackId])
        podcast_id = Podcast.find_by_collectionId(params[:collectionId]).id

        if episode
            render json: {"message" => "That episode exists"}
        else
            new_episode = Episode.create!(:podcast_id=>podcast_id, :collectionName=>params[:collectionName], :collectionId=>params[:collectionId], :artworkUrl160=>params[:artworkUrl100], :artworkUrl600=>params[:artworkUrl600], :episodeUrl=>params[:episodeUrl], :trackName=>params[:trackName], :description=>params[:description], :releaseDate=>params[:releaseDate], :trackTimeMillis=>params[:trackTimeMillis], :trackId=>params[:trackId])
            render json: new_episode, status: :created
        end
    end

    def index
        episodes = Episode.all
        render json: episodes, status: :ok
    end

    def show
        episode = Episode.find_by_trackId(params[:id])
        render json: episode, status: :ok
    end

    def updated
    end

    private

    def episode_params
        params.permit(:collectionName, :collectionId, :artworkUrl100, :artworkUrl600, :episodeUrl, :trackName, :description, :releaseDate, :trackTimeMillis, :trackId)
    end

end
