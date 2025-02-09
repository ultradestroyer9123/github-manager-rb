class GithubReposController < ApplicationController
  def index
    @github_user = GithubUser.find_by(username: params[:github_user_id])
  end

  def show
    @github_user = GithubUser.find_by(username: params[:github_user_id])
    @github_repo = @github_user.github_repos.find_by(repo: params[:id])
  end
end
