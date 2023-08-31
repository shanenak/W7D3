class SessionsController < ApplicationController
    before_action :require_logged_in, only:[:destroy]
    before_action :require_logged_out, only:[:new, :create]

    def new
        render :new
    end

    def create
        @user = User.find_by_credentials(session_params)
        if @user
            redirect_to user_url(@user.id)
        else
            flash.now[:errors] = 'No user found'
            render :new
        end
    end

    def destroy
        logout!
        render :new
    end

    private

    def session_params
        params.require(:user).permit(:username, :password)
    end
end
