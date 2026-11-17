class SessionsController < ApplicationController
    skip_before_action :authorize, only: :create

    def create 
        user = User.find_by(email: params[:email])

        if user&.authenticate(params[:password])
            session[:user_id] = user.id 
            render json: {
                id: user.id,
                email: user.email,
                first_name: user.first_name,
                last_name: user.last_name,
                admin: user.admin
            }, status: :ok
        else
            render json: {error: "Invalid email or password"},
                status: :unathorized
        end
    end
    def destroy
        session.delete(:user_id)
        head :no_content
    end
end
