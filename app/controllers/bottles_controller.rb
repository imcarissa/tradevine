class BottlesController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_bottle, only: [:show, :edit, :update]


    def new
      if params[:user_id] && @user = User.find_by_id(params[:user_id])
        @bottle = @user.bottles.build
      else
        flash[:errors] = "bottle does not exist" if params[:user_id]
        @bottle = Bottle.new
      end
        @bottle.build_category
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
           flash[:message] = "Entry successful"
           redirect_to bottle_path(@bottle)
        else
           render :new
        end
    end

    def edit
      redirect_to bottles_path if !@bottle || @bottle.user != current_user
      @bottle.build_category if !@bottle.category
    end
  
    def update 
      if @bottle.update(bottle_params)
        flash[:message] = "Entry successfully updated"
        redirect_to bottle_path(@bottle)
      else
        render :edit
      end
    end

    def show
        redirect_to bottles_path if !@bottle
    end


    def destroy
      Bottle.find(params[:id]).destroy
      redirect_to bottles_path
   end

    private

    def bottle_params 
        params.require(:bottle).permit(:wine_name, :vintage, :winery, :region, :description, :category_id, category_attributes: [:name])
    end

    def set_bottle
      @bottle = Bottle.find_by_id(params[:id])
    end

end
