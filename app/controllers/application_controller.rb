class ApplicationController < ActionController::Base

    def hello
        render html: "hello world"
    end

    def goodbye
        render html: "goodbye"
    end

    def extra
        render json: {
            "message": "hello world",
            "error": "goodbye"
        }
    end

end
