class ItemsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :not_found

    def index
        items = Item.all
        render json: items, include: :user
    end

    private

    def not_found
        render json: { errors: 'You done fucked up, A-A-ron!! We can\'t find our items!' }, status: :not_found
    end
end
