class BottlesController < ApplicationController
    before_action :redirect_if_not_logged_in


    def index
        @bottles = Bottle.all
    end

    def new
        @bottle = Bottle.new 
    end

    def create
        @bottle = current_user.bottles.build(bottle_params)
        if @bottle.save
            redirect_to bottles_path
        else
            render :new
        end
    end

    def show
        @bottle = Bottle.find_by_id(params[:id])
    end

    private

    def bottle_params 
        params.require(:bottle).permit(:name, :type, :vintage, :region, :notes, :description)
    end

end
