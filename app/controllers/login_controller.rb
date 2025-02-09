class LoginController < ApplicationController
    def show; end

    def create
        @user = User.find_by(email: params[:username])

        if @user.present? && @user.authenticate(params[:password])

            session[:user_id] = @user.id
            redirect_to users_path, notice: "Welcome, #{@user.name}"
        else

            message = "Incorrect email or password."
            redirect_to login_path, notice: message
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to login_path, notice: "You have successfully logged out."
    end
end
