class WelcomeController < ApplicationController

    before_action :authorized, only: [:updated_at] 

    def index
        render json: {"message: "=> "I'M ON THE INTERNET."}
    end

    def updated_at
    end
end
