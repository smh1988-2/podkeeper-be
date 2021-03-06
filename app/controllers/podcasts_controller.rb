class PodcastsController < ApplicationController

    before_action :require_login, only: [:updated]

    def create
        podcast = Podcast.find_by_collectionId(params[:collectionId])
        if podcast
            render json: {"message" => "That podcast exists"}
        else
            new_podcast = Podcast.create!(podcast_params)
            render json: new_podcast, status: :created
        end
    end

    def index
        podcasts = Podcast.all
        render json: podcasts, status: :ok
    end

    def show
        podcast = Podcast.find_by_collectionId(params[:id])
        render json: podcast, status: :ok
    end

    # return all of the podcasts that a user is subscribed to
    def my_podcasts
        subscriptions = UserSubscription.where(:user_id=>params[:id])
        render json: subscriptions, include: :podcast, status: :ok
    end

    def random
        render json: Podcast.all.order("random()").limit(6).as_json, status: :ok
    end

    def updated
    end

    private

    def podcast_params
        params.permit(:collectionName, :artistName, :artworkUrl100, :artworkUrl600, :primaryGenreName, :artistId, :collectionId)
    end

end
