class ReviewsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_review, only: [:edit, :update, :show]

    def index
        if params[:bottle_id] && @bottle = Bottle.find_by_id(params[:bottle_id])
          @reviews = @bottle.reviews
        else
          flash[:errors] = "bottle does not exist" if params[:bottle_id]
          @reviews = Review.all
        end
    end
    
    def new
      if params[:bottle_id] && @bottle = Bottle.find_by_id(params[:bottle_id]) && !current_user
        @review = @bottle.reviews.build
      else
        @review = Review.new
      end
    end   

    def create
        @review = current_user.reviews.build(review_params)
        if @review.save
          flash[:message] = "Sucessfully created review"
            redirect_to reviews_path
        else
            render :new
        end
    end
    
    def edit
    end
    

    def update 
      if @review.update(review_params)
        flash[:message] = "Review successfully updated"
        redirect_to bottle_review_path(@review)
      else
        render :edit
      end
    end


    def show
      redirect_to bottle_review_path if !@review
    end


    def destroy
      Review.find(params[:id]).destroy
      redirect_to reviews_path
    end
  
        private
  
      def review_params 
        params.require(:review).permit(:content, :bottle_id)
      end

      def set_review
        @review = Review.find_by_id(params[:id])
      end
  end
