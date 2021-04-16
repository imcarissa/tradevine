class BottlesController < ApplicationController
    before_action :redirect_if_not_logged_in


    def new
      if params[:user_id] && @user = User.find_by_id(params[:user_id])
        @bottle = @user.bottles.build
        @bottle.build_category if !@bottle.category
      else
        flash[:errors] = "bottle does not exist" if params[:user_id]
        @bottle = Bottle.new
      end
    end
    
    def index
      if params[:user_id] && @user = User.find_by_id(params[:user_id])
        @bottles = @user.bottles.alpha
      else
        flash[:errors] = "bottle does not exist" if params[:user_id]
        @bottles = Bottle.alpha
      end
    end

    def create
      @bottle = current_user.bottles.build(bottle_params)
        if @bottle.save
           redirect_to bottles_path
        else
           render :new
        end
    end

    def edit
      set_bottle
      redirect_to bottles_path if !@bottle || @bottle.user != current_user
      @bottle.build_category if !@bottle.category
    end
  
    def update 
       set_bottle
       redirect_to bottles_path if !@bottle || @bottle.user != current_user
      if @bottle.update(bottle_params)
        redirect_to bottle_path(@bottle)
      else
        render :edit
      end
    end


    def show
        set_bottle
        redirect_to bottles_path if !@bottle
    end

    private

    def bottle_params 
        params.require(:bottle).permit(:wine_name, :vintage, :winery, :region, :description, :category_id, category_attributes: [:name])
    end

    def set_bottle
      @bottle = Bottle.find_by_id(params[:id])
    end

end
