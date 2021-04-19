class SessionsController < ApplicationController


    def create 
      user = User.find_by(username: params[:user][:username])
      if user && user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect_to user_path(user)
      else
        flash[:errors] = "Incorrect login info. Please try again."
        redirect_to login_path
      end
    end

    def destroy
    session.clear
        redirect_to root_path
    end

    def omniauth
      @user = User.find_with_omniauth(auth)
      if @user
          session[:user_id] = @user.id
          redirect_to user_path(@user)
      else
          flash[:errors] = "Please log in"
          redirect_to login_path
      end
    end

    private

    def auth
      request.env['omniauth.auth']
    end

end
