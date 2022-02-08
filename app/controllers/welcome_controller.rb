class WelcomeController < ApplicationController

    before_action :require_login, only: [:updated_at] 

    def index
        render json: {"message: "=> "I'M ON THE INTERNET."}
    end

    def updated_at
    end
end
