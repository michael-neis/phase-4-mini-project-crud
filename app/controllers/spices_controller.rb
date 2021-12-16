class SpicesController < ApplicationController

    def index
        spices = Spice.all
        render json: spices
    end


    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    
    def update
        spice = Spice.find_by_id(params[:id])
        spice.update(spice_params)
        render json: spice, status: :ok
    end


    def destroy
        spice = Spice.find_by_id(params[:id])
        spice.destroy
        render json: spice, status: :ok
    end

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end
end
