class SearchController < ApplicationController
  def index
    if params[:search].present?
      @clients = Client.search(params[:search])
      @projects = Project.search(params[:search])
    end
  end
end
