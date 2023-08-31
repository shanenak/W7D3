class UsersController < ApplicationController
    before_action :require_logged_in, only: [:destroy]
    before_action :require_logged_out, only: [:new, :create]

    def new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            render :show
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def destroy
        logout!
        redirect_to new_user_url
    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end
end
