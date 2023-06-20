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

    def tema
        respond_to do |format|
            format.html {
                render html: "test"
            }
            format.json {
                render json: {
                    "me": "te"
                }
            }
        end
    end

    private
        def check_admin
            if current_user.role != "admin"
                redirect_to root_path
                return
            end
        end

        

end
