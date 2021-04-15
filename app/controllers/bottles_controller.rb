class BottlesController < ApplicationController
    before_action :redirect_if_not_logged_in


    def new
      if params[:user_id] && @user = User.find_by_id(params[:user_id])
        @bottle = @user.bottles.build
      else
        flash[:errors] = "Post does not exist" if params[:user_id]
        @bottle = Bottle.new
      end
    end
    
    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
          @bottles = @user.bottles.alpha
      else
        flash[:errors] = "Post does not exist" if params[:user_id]
        @bottles = Bottle.alpha
      end
    end

    def create
      @bottle = current_user.bottles.build(bottle_params)
        if @bottle.save
           redirect_to bottles_path
        else
           redirect_to new_bottle_path
        end
    end


    def show
        @bottle = Bottle.find_by_id(params[:id])
        redirect_to bottles_path if !@bottle
    end

    private

    def bottle_params 
        params.require(:bottle).permit(:wine_name, :vintage, :winery, :region, :description)
    end

end
