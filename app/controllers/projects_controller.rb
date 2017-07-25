class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end
  def show
    @client = Client.find(params[:client_id])
    @project = Project.find(params[:id])
  end
  def invoice
    @project = Project.find(params[:project_id])
  end
  def new
    @client = Client.find(params[:client_id])
    @project = @client.projects.new()
  end
  def create
    @client = Client.find(params[:client_id])
    @project = @client.projects.new(project_params)
    if @project.save
      redirect_to client_project_path(@client, @project)
    else
      render :new
    end
  end
  def edit
    @client = Client.find(params[:client_id])
    @project = Project.find(params[:id])
  end
  def update
    @client = Client.find(params[:client_id])
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to client_project_path(@client, @project)
    else
      render :edit
    end
  end
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  private
  def project_params
    params.require(:project).permit(:address, :description, :price)
  end
end
