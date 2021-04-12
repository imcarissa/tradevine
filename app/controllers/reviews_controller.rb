class ReviewsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        if params[:bottle_id] && @bottle = Bottle.find_by_id(params[:bottle_id])
          @reviews = @bottle.reviews 
        else
          flash[:errors] = "bottle does not exist" if params[:bottle_id]
          @reviews = Review.all
        end
    end
  
  
    def new
      if params[:bottle_id] && @bottle = Bottle.find_by_id(params[:bottle_id])
        @review = @bottle.reviews.build(review_params)
      else
        flash[:errors] = "This post does not exist" if params[:bottle_id]
        @review = Review.new
      end
    end
  
    def create
        @review = current_user.reviews.build(review_params)
        if @review.save
            redirect_to review_path
        else
            redirect_to bottles_path
        end
    end
  
      def show
        @review = Review.find_by(id: params[:id])
      end
  
      def edit
        @review = Review.find_by(id: params[:id])
      end
  
      def update 
      
      end
  
        private
  
      def review_params 
          params.require(:review).permit(:content)
      end

  end
