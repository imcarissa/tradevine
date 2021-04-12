class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          flash[:errors] = "Failed to create account: #{@user.errors.full_messages.to_sentence}"
          redirect_to signup_path
        end
    end

    def show 
      @user = User.find_by_id(params[:id])
      redirect_to '/' if !@user
    end

    def edit

    end

    def update

    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end
