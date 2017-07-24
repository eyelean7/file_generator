class ClientsController < ApplicationController
  def index
    @clients = Client.all
  end
  def show
    @client = Client.find(params[:id])
    @projects = @client.projects
  end
end
