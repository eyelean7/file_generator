class ProjectsController < ApplicationController
  def show
    @client = Client.find(params[:client_id])
    @project = Project.find(params[:id])
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

  private
  def project_params
    params.require(:project).permit(:address, :description, :price)
  end
end
