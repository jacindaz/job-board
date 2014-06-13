class JobsController < ActionController::Base

  def index
    @jobs = Job.all
  end

  def new
  end

  def create
  end

  def show
  end

  def jobs_params
  end

end

