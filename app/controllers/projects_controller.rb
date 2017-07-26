class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end
  def show
    @client = Client.find(params[:client_id])
    @project = Project.find(params[:id])
  end
  def invoice
    # file_name = @project.id +" _ "+ @client.name +" - "+ @project.address
    date = Time.now
    @date = date.month.to_s+"-"+date.day.to_s+"-"+date.year.to_s
    @project = Project.find(params[:project_id])
    @client = @project.client
    @job_number = @project.id
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name",
        :disposition => "inline",
        :template => "projects/invoice.pdf.erb"
      end
    end
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
