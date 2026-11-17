class UsersController < ApplicationController
    def index
        render json: User.all
    end

    def show
        user = User.find_by(id: session[:user_id])
        if user 
            render json: user, status: :ok
        else
            render json: {error: "Not Authorized"}
        end
    end

    def create 
        user = User.create!(user_params)
        if user.valid?
            session[:user_id] = user.id
            render json: user, status: : created
        else
            render json: {errors: user.errors.full_messages}, status: :uprocessable_entiry
        end
    end
end
