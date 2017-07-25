class ClientsController < ApplicationController
  def index
    @clients = Client.all
  end
  def show
    @client = Client.find(params[:id])
    @projects = @client.projects
  end
  def new
    @client = Client.new()
  end
  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to client_path(@client)
    else
      render :new
    end
  end
  def destroy
    @client = Client.find(params[:id])
    @client.projects.destroy_all
    @client.destroy
    redirect_to clients_path
  end

  private
  def client_params
    params.require(:client).permit(:name, :billing_address, :phone)
  end
end
