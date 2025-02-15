class ScrapersController < ApplicationController
  def index
    @scrapers = DuckDuckGoSearch.all
    respond_to do |format|
      format.html
      format.json { render json: @scrapers }
    end
  end

  def show
  end

  def create
    ScraperManager.process(params[:username])
    redirect_to scrapers_path
  end

  def destroy
    if params[:username].present?
      DuckDuckGoSearch.find_by(query: params[:username]).duck_duck_go_results.destroy_all
      DuckDuckGoSearch.where(query: params[:username]).destroy_all
    end

    redirect_to scrapers_path
  end
end
