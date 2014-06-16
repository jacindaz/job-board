class JobsController < ApplicationController

  def index
    @jobs = Job.order('created_at ASC').all
  end

  # GET request that includes route to a form to create a new job
  def new
    @job = Job.new
  end

  # POST request for a new job, sends to DB
  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to "/jobs/#{@job.id}"
      #binding.pry
    else
      flash[:notice] = "Uh oh! Your job could not be saved."
      redirect_to '/jobs'
    end
  end

  def show
    #binding.pry
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to job_params
    else
      render 'show'
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :description, :company_id)
  end

end

