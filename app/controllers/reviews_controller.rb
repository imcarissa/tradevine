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
        set_review
      end
  
      def edit
        set_review
      end
  
      def update 
        set_review
        if @review.update(review_params)
          redirect_to review_path(@comment)
        else
          render :edit
        end
      end

  #  def destroy
  #    set_comment
  #    @comment.destroy
  #    flash[:message] = "Your entry as been deleted."
  #    redirect_to posts_path
  #  end
  
        private
  
      def review_params 
          params.require(:review).permit(:content)
      end

      def set_review
        @review = Review.find_by(id: params[:id])
      end

  end
