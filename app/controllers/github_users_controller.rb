class GithubUsersController < ApplicationController
    def index
        @github_users = GithubUser.all
        respond_to do |format|
            format.html
            format.json { render json: @github_users }
        end
    end

    def create
        GithubManager.process(params[:username])

        redirect_to github_path
    end

    def destroy
        GithubUser.where(username: params[:username]).delete_all if params[:username].present?
        redirect_to github_path
    end
end

