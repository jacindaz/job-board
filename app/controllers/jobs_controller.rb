class JobsController < ActionController::Base

  def index
    @jobs = Job.order('created_at ASC').all
  end

  def new
  end

  def create
  end

  def show
    @job = Job.find(params[:id])
  end

  def jobs_params
  end

end

