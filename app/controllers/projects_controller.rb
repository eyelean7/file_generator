class ProjectsController < ApplicationController

  before_action :authorize_user

  def index
    @projects = Project.all
  end

  def show
    @client = Client.find(params[:client_id])
    @project = Project.find(params[:id])
  end

  def invoice
    date = Time.now
    @date = date.month.to_s+"-"+date.day.to_s+"-"+date.year.to_s
    @project = Project.find(params[:project_id])
    @client = @project.client
    @job_number = @project.job_number
    file_name = "#{@project.job_number} - #{@client.name} -  #{@project.address}"
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "#{file_name}",
        :disposition => "inline",
        :template => "projects/invoice.pdf.erb",
        :page_size => 'Letter'
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
    @project.write_attribute(:address, @project.street + " " + @project.line2 + " " + @project.city + " " + @project.state + " " + @project.zip)
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
    project_info = @client.projects.new(project_params)
    @project.update_attribute(:address, project_info.street + " " + project_info.line2 + " " + project_info.city + " " + project_info.state + " " + project_info.zip)
    if @project.update(project_params)
      redirect_to client_project_path(@client, @project)
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.jobs.destroy_all
    @project.destroy
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:job_number, :street, :line2, :city, :state, :zip, :address, :description, :price)
  end

end
