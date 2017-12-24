class JobsController < ApplicationController
  before_action :set_job, only: [:edit, :update, :destroy]
  before_action :set_project
  before_action :set_client
  before_action :authorize_user

  # GET /jobs/new
  def new
    @job = @project.jobs.new()
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = @project.jobs.new(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to client_project_path(@client, @project), notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to client_project_path(@client, @project), notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to client_project_path(@client, @project), notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end
    def set_project
      @project = Project.find(params[:project_id])
    end
    def set_client
      @client = @project.client
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:description, :hours, :rate)
    end
end
