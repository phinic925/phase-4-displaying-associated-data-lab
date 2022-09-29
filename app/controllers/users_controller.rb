class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    def show
        user = User.find(params[:id])
        render json: user, include: :items
    end

    private

    def not_found
        render json: { errors: "User not found" }, status: :not_found
    end
end
