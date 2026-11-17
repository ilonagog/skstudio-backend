class ApplicationController < ActionController::Base
    skip_forgery_protection 
    # include ActionController::Cookies
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_res
    rescue_from ActiveRecord::RecordNotFound, with: :render_recod_not_found

    before_action :authorize

    private
    def authorize
        @current_user = User.find_by(id: session[:user_id])
        render json: {error: "Not Authorized!"}, status: :unauthorized unless @current_user
    end
    def render_unprocessable_entity_res(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :uprocessable_content
    end
    def render_record_not_found(error)
        render json: { message: error.message}, status: :not_found
    end
end
