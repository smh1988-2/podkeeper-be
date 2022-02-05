class WelcomeController < ApplicationController

    def index
        render json: {"message: "=> "I'M ON THE INTERNET."}
    end
end
